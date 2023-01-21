import {calendar_v3} from "@googleapis/calendar";
import {GaxiosResponse} from "googleapis-common";

export type AddedEvent = GaxiosResponse<calendar_v3.Schema$Event>;

export type EventToAdd = calendar_v3.Schema$Event;
