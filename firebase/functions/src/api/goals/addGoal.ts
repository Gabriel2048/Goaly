import * as functions from "firebase-functions";
import { GoalyCollections } from "../../goaly_collections";
import { GoogleCalendarService } from "../../services/googleCalendarService";
import { GoogleOauthClientFactory } from "../../services/googleOauthClientFactory";
import { GoalFrequency } from "../../types/goalFrequency";
import { buildRecurrence } from "../../services/buildRecurence";
import { GoalTimeOfDay } from "../../types/goalTymeOfDay";
import { GoalType } from "../../types/goalType";

type AddGoalRequest = {
    googleAccessToken: string;
    goal: Goal
}

type Goal = {
    timeOfDay: GoalTimeOfDay;
    frequency: GoalFrequency;
    title?: string;
    goalType: GoalType;
};

export const addGoalEdnpoint = async (request: AddGoalRequest, context: functions.https.CallableContext) => {
  if (!context.auth) {
    return;
  }

  const auth = GoogleOauthClientFactory.createFromToken(request.googleAccessToken);
  const calendarService = new GoogleCalendarService(auth);

    const userIanaTimeZone = await calendarService.getUsersIanaTimezone();

    const recurrence = buildRecurrence(request.goal.frequency, request.goal.timeOfDay);
    const nextMonday = getNextMonday();
    
    const event = await calendarService.addEvent({
        summary: "[Goaly] My event",
        start: {
            dateTime: nextMonday.toISOString(),
            timeZone: userIanaTimeZone,
        },
        end: {
            dateTime: nextMonday.toISOString(),
            timeZone: userIanaTimeZone,
        },
        recurrence,
    });

  await GoalyCollections.goalsOfUser(context.auth.uid).add({
    ...request.goal,
    "eventId": event.data.id,
  });

    return { message: "", code: 200 };
};

const getNextMonday = (): Date => {
  const next = new Date();
  next.setDate(next.getDate() - next.getDay() + 8);
  return next;
};