/*
  Warnings:

  - You are about to drop the column `createdAt` on the `codeResetPassword` table. All the data in the column will be lost.
  - Added the required column `expirationDate` to the `codeResetPassword` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "codeResetPassword" DROP COLUMN "createdAt",
ADD COLUMN     "expirationDate" TIMESTAMP(3) NOT NULL;
