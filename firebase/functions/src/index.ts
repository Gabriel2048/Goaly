import * as functions from "firebase-functions";
import * as admin from 'firebase-admin'
import { GoogleOauthClientFactory } from "./services/googleOauthClientFactory";
import { GoalyCollections } from "./goaly_collections";
import { GoogleCalendarService } from "./services/googleCalendarService";
admin.initializeApp()

type AddGoalRequest = {
  googleAccessToken: string;
  goal: object
}

export const addGoal = functions.https.onCall(async (request: AddGoalRequest, _context) => {
  const auth = GoogleOauthClientFactory.createFromToken(request.googleAccessToken);
  const calendarService = new GoogleCalendarService(auth);

  const event = await calendarService.addEvent({
    summary: "[Goaly] My event",
    start: {
      dateTime: "2022-12-29T09:00:00",
      timeZone: "America/New_York",
    },
    end: {
      dateTime: "2022-12-29T10:00:00",
      timeZone: "America/New_York",
    },
  });

  await GoalyCollections.goalsOfUser(_context.auth!.uid).add({
    ...request.goal,
    'eventId': event.data.id
  });

  return { message: "", code: 200 };
});

export const addNewUserToUsersCollection = functions.auth.user().onCreate(async (user) => {
  await GoalyCollections.users.doc(user.uid).set({});
});