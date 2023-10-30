/// This file contains all the endpoints used in the application

const apiVersion = '0.0.0';

/// Development APIs
// const baseUrl = 'https://dev.cloud/api/v1';
// const authBaseUrl = 'https://dev.cloud/auth';
// const appBaseUrl = "https://dev.cloud";

/// Production APIs
const baseUrl = 'https://prod.cloud/api/v1';
const authBaseUrl = 'https://prod.cloud/auth';
const appBaseUrl = "https://prod.cloud";

/// Auth APIs
const authLoginUrl = '$authBaseUrl/login';
const authForgotUrl = '$authBaseUrl/forgot';
const authRegisterUrl = '$authBaseUrl/register';
String authForgotConfirmUrl({required String token}) => '$authForgotUrl/$token';
String authConfirmUrl({required String token}) => '$authBaseUrl/confirm/$token';
