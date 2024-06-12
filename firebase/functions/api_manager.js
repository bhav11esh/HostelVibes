const axios = require("axios").default;
const qs = require("qs");

async function _bookinformationCall(context, ffVariables) {
  var userName = ffVariables["userName"];
  var checkin = ffVariables["checkin"];
  var checkout = ffVariables["checkout"];
  var members = ffVariables["members"];
  var url = ffVariables["url"];
  var type = ffVariables["type"];
  var cityid = ffVariables["cityid"];
  var hotelid = ffVariables["hotelid"];
  var timestamp = ffVariables["timestamp"];

  var url = `https://919huplmmh.execute-api.ap-south-1.amazonaws.com/prodTravelAPI/lambdafunction/${type}?user_id=${userName}&checkin=${checkin}&checkout=${checkout}&members=${members}&hotelid=${hotelid}&cityid=${cityid}&url=${url}&timestamp=${timestamp}`;
  var headers = { "Content-Type": `application/json` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
  });
}

/// Helper functions to route to the appropriate API Call.

async function makeApiCall(context, data) {
  var callName = data["callName"] || "";
  var variables = data["variables"] || {};

  const callMap = {
    BookinformationCall: _bookinformationCall,
  };

  if (!(callName in callMap)) {
    return {
      statusCode: 400,
      error: `API Call "${callName}" not defined as private API.`,
    };
  }

  var apiCall = callMap[callName];
  var response = await apiCall(context, variables);
  return response;
}

async function makeApiRequest({
  method,
  url,
  headers,
  params,
  body,
  returnBody,
}) {
  return axios
    .request({
      method: method,
      url: url,
      headers: headers,
      params: params,
      ...(body && { data: body }),
    })
    .then((response) => {
      return {
        statusCode: response.status,
        headers: response.headers,
        ...(returnBody && { body: response.data }),
      };
    })
    .catch(function (error) {
      return {
        statusCode: error.response.status,
        headers: error.response.headers,
        ...(returnBody && { body: error.response.data }),
        error: error.message,
      };
    });
}

const _unauthenticatedResponse = {
  statusCode: 401,
  headers: {},
  error: "API call requires authentication",
};

function createBody({ headers, params, body, bodyType }) {
  switch (bodyType) {
    case "JSON":
      headers["Content-Type"] = "application/json";
      return body;
    case "TEXT":
      headers["Content-Type"] = "text/plain";
      return body;
    case "X_WWW_FORM_URL_ENCODED":
      headers["Content-Type"] = "application/x-www-form-urlencoded";
      return qs.stringify(params);
  }
}

module.exports = { makeApiCall };
