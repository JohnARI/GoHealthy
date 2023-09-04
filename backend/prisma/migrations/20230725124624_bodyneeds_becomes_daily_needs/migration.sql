/*
  Warnings:

  - You are about to drop the `BodyNeeds` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "BodyNeeds" DROP CONSTRAINT "BodyNeeds_bodyId_fkey";

-- DropTable
DROP TABLE "BodyNeeds";

-- CreateTable
CREATE TABLE "DailyNeeds" (
    "id" TEXT NOT NULL,
    "bodyId" TEXT NOT NULL,
    "calories" INTEGER NOT NULL,
    "proteins" INTEGER NOT NULL,
    "carbohydrates" INTEGER NOT NULL,
    "lipids" INTEGER NOT NULL,

    CONSTRAINT "DailyNeeds_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "DailyNeeds_bodyId_key" ON "DailyNeeds"("bodyId");

-- AddForeignKey
ALTER TABLE "DailyNeeds" ADD CONSTRAINT "DailyNeeds_bodyId_fkey" FOREIGN KEY ("bodyId") REFERENCES "BodyBuild"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
