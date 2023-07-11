-- CreateEnum
CREATE TYPE "ActivityLevel" AS ENUM ('SEDENTARY', 'LIGHTLY_ACTIVE', 'MODERATELY_ACTIVE', 'VERY_ACTIVE', 'EXTREMELY_ACTIVE');

-- CreateEnum
CREATE TYPE "Sex" AS ENUM ('MALE', 'FEMALE', 'OTHER', 'NOT_SPECIFIED');

-- CreateTable
CREATE TABLE "BodyBuild" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "weightGoal" DOUBLE PRECISION NOT NULL,
    "currentWeight" DOUBLE PRECISION NOT NULL,
    "sexe" TEXT NOT NULL,
    "activityLevel" "ActivityLevel" NOT NULL,
    "height" DOUBLE PRECISION NOT NULL,
    "age" INTEGER NOT NULL,

    CONSTRAINT "BodyBuild_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "BodyBuild" ADD CONSTRAINT "BodyBuild_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
