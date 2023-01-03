import * as functions from "firebase-functions";
import { calendar } from "@googleapis/calendar";
import { GoogleOauthClientFactory } from "./services/googleOauthClientFactory";
import * as admin from 'firebase-admin'
import { GoalyCollections } from "./goaly_collections";
admin.initializeApp()

type AddGoalRequest = {
  googleAccessToken: string;
}

export const addGoal = functions.https.onCall(async (request: AddGoalRequest, _context) => {
  const auth = GoogleOauthClientFactory.createFromToken(request.googleAccessToken);

  const calendarClient = calendar("v3");
  const event = await calendarClient.events.insert({
    calendarId: "primary",
    auth,
    requestBody: {
      summary: "[Goaly] My event",
      start: {
        dateTime: "2022-12-29T09:00:00",
        timeZone: "America/New_York",
      },
      end: {
        dateTime: "2022-12-29T10:00:00",
        timeZone: "America/New_York",
      },
    },
  });

  await GoalyCollections.goalsOfUser(_context.auth!.uid).add({
    'name': "[Goaly] My event",
    'eventId': event.data.id
  });

  return { message: "", code: 200 };
});

export const addNewUserToUsersCollection = functions.auth.user().onCreate(async (user) => {
  await GoalyCollections.users.doc(user.uid).set({});
});