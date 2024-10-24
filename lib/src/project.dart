import 'package:celest/celest.dart';

const project = Project(
  name: 'trivia_backend',
);

const tursoDbUrl = env('TURSO_DATABASE_URL');
const tursoDbJwtToken = env('TURSO_DATABASE_JWT_TOKEN');
