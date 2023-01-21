import * as functions from "firebase-functions";
import {GoalyCollections} from "../../goaly_collections";
import {GoogleCalendarService} from "../../services/googleCalendarService";
import {GoogleOauthClientFactory} from "../../services/googleOauthClientFactory";
import {GoalFrequency} from "../../types/goalFrequency";

type AddGoalRequest = {
    googleAccessToken: string;
    goal: Goal
}

type Goal = {
    timeOfDay: string;
    frequency: GoalFrequency;
    title?: string;
    description?: string;
};

export const addGoalEdnpoint = async (request: AddGoalRequest, context: functions.https.CallableContext) => {
  const auth = GoogleOauthClientFactory.createFromToken(request.googleAccessToken);
  const calendarService = new GoogleCalendarService(auth);

  const event = await calendarService.addEvent({
    summary: "[Goaly] My event",
    start: {
      dateTime: "2023-01-16T09:00:00",
      timeZone: "America/New_York",
    },
    end: {
      dateTime: "2023-01-16T10:00:00",
      timeZone: "America/New_York",
    },
    recurrence: ["RRULE:FREQ=DAILY"],
  });

  await GoalyCollections.goalsOfUser(context.auth!.uid).add({
    ...request.goal,
    "eventId": event.data.id,
  });

  return {message: "", code: 200};
};
