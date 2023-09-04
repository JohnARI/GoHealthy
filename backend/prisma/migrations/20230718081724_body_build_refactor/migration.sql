/*
  Warnings:

  - A unique constraint covering the columns `[userId]` on the table `BodyBuild` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "BodyBuild_userId_key" ON "BodyBuild"("userId");
