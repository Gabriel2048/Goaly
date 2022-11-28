import * as functions from "firebase-functions";

export const addGoal = functions.https.onCall((request, context) => {
  return {message: '', code: 200};
});
