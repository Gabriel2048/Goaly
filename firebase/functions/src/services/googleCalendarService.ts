import { OAuth2Client } from "google-auth-library";
import { calendar } from "@googleapis/calendar";
import { AddedEvent, EventToAdd } from "../types/google_calendar_types";

const calendarClient = calendar("v3");

export class GoogleCalendarService {
  private readonly calendarId = "primary";
  constructor(private auth: OAuth2Client) { }

  async addEvent(eventToAdd: EventToAdd): Promise<AddedEvent> {
    return await calendarClient.events.insert({
      calendarId: this.calendarId,
      auth: this.auth,
      requestBody: eventToAdd,
    });
  }

  async getUsersIanaTimezone(): Promise<string> {

    const userCalendar = await calendarClient.calendars.get({ calendarId: this.calendarId, auth: this.auth });

    if (!userCalendar.data || !userCalendar.data.timeZone) {
      throw new Error("Unable to get user's IANA TimeZone");
    }

    return userCalendar.data.timeZone;
  }
}
