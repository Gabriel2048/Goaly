import { OAuth2Client } from "google-auth-library";
import { calendar } from "@googleapis/calendar";
import { AddedEvent, EventToAdd } from "../types/google_calendar_types";

export class GoogleCalendarService {
    constructor(private auth: OAuth2Client) {

    }

    async addEvent(a: EventToAdd): Promise<AddedEvent> {
        const calendarClient = calendar("v3");
        return await calendarClient.events.insert({
            calendarId: "primary",
            auth: this.auth,
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
    }
}