import { OAuth2Client } from "google-auth-library";
import { calendar } from "@googleapis/calendar";
import { AddedEvent, EventToAdd } from "../types/google_calendar_types";

export class GoogleCalendarService {
    constructor(private auth: OAuth2Client) { }

    async addEvent(eventToAdd: EventToAdd): Promise<AddedEvent> {
        const calendarClient = calendar("v3");
        return await calendarClient.events.insert({
            calendarId: "primary",
            auth: this.auth,
            requestBody: eventToAdd,
        });
    }
}