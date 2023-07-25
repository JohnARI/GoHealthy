-- DropForeignKey
ALTER TABLE "DailyNeeds" DROP CONSTRAINT "DailyNeeds_bodyId_fkey";

-- AddForeignKey
ALTER TABLE "DailyNeeds" ADD CONSTRAINT "DailyNeeds_bodyId_fkey" FOREIGN KEY ("bodyId") REFERENCES "BodyBuild"("id") ON DELETE CASCADE ON UPDATE CASCADE;
