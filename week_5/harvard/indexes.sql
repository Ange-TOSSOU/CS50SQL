CREATE INDEX "search_enrollments_by_student_id"
ON "enrollments" ("student_id");

CREATE INDEX "search_enrollments_by_course_id" 
ON "enrollments" ("course_id");

CREATE INDEX "search_courses_by_semester"
ON "courses" ("semester");

CREATE INDEX "search_satisfies_by_course_id"
ON "satisfies" ("course_id");
