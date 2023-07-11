/*
  Warnings:

  - Changed the type of `sexe` on the `BodyBuild` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "BodyBuild" DROP COLUMN "sexe",
ADD COLUMN     "sexe" "Sex" NOT NULL;
