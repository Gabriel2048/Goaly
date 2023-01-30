import { GoalFrequency } from "../types/goalFrequency";
import { GoalTimeOfDay } from "../types/goalTymeOfDay";

export const buildRecurrence = (frequency: GoalFrequency, timeOfDay: GoalTimeOfDay): string[] => {

    const frequnecy = buildFrequency(frequency);

    const byHour = buildByHour(timeOfDay);

    return [`RRULE:${frequnecy}${byHour ? ';' : ''}${byHour}`];
};

const buildFrequency = (frequency: GoalFrequency): string => {
    switch (frequency) {
        case GoalFrequency.daily:
            return 'FREQ=DAILY'
        case GoalFrequency.threeTimesPerWeek:
            return 'FREQ=WEEKLY;INTERVAL=1;BYDAY=MO,WE,FR'
        case GoalFrequency.twicePerWeek:
            return 'FREQ=WEEKLY;INTERVAL=1;BYDAY=TU,TH'
        case GoalFrequency.weekly:
            return 'FREQ=WEEKLY;INTERVAL=1;BYDAY=WE'
        case GoalFrequency.monthly:
            return 'FREQ=MONTHLY;INTERVAL=1;BYDAY=MO,WE,FR'
    };
}

const buildByHour = (timeOfDay: GoalTimeOfDay): string | null => {
    switch (timeOfDay) {
        case GoalTimeOfDay.morning:
            return 'BYHOUR=8';
        case GoalTimeOfDay.midday:
            return 'BYHOUR=12';
        case GoalTimeOfDay.evening:
            return 'BYHOUR=18';
        case GoalTimeOfDay.anytime:
            return null;
    }
}