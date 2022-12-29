import * as functions from "firebase-functions";
import { calendar } from "@googleapis/calendar";
import { GoogleOauthClientFactory } from "./services/googleOauthService";

type AddGoalRequest = {
  googleAccessToken: string;
}

export const addGoal = functions.https.onCall(async (request: AddGoalRequest, context) => {

  const auth = GoogleOauthClientFactory.createFromToken(request.googleAccessToken);

  const calendarClient = calendar("v3");
  await calendarClient.events.insert({
    calendarId: 'primary',
    auth,
    requestBody: {
      summary: '[Goaly] My event',
      start: {
        dateTime: '2022-12-29T09:00:00',
        timeZone: 'America/New_York',
      },
      end: {
        dateTime: '2022-12-29T10:00:00',
        timeZone: 'America/New_York',
      },
    }
  })

  return { message: "", code: 200 };
});