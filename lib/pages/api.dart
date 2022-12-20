const baseUrl = "http://localhost:8000/api/";

Map<String, String> getAuthHeaders(String accessToken) {
  Map<String, String> authHeaders = {
    'Content-Type': 'application/json; charset=UTF-8',
    "Authorization": "Bearer $accessToken",
  };
  return authHeaders;
}

const loginUrl = "${baseUrl}token-auth/";

const deviceTypeUrl = "${baseUrl}get-device-types/";

const actionUrl = "${baseUrl}get-possible-actions/";

// get-possible-actions/