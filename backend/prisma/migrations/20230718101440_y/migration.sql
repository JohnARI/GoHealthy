/*
  Warnings:

  - Added the required column `createdAt` to the `codeResetPassword` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "codeResetPassword" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL;
