import * as functions from "firebase-functions";

export const addGoal = functions.https.onCall((request, context) => {

  const authorizationHeader = context.rawRequest.headers.authorization as String;
  if(authorizationHeader){
    const token = authorizationHeader.split(' ' )[1];
    console.log(token);
  }

  return {message: "", code: 200};
});