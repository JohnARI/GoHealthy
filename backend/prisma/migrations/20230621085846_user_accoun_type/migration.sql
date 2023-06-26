-- CreateEnum
CREATE TYPE "AccountType" AS ENUM ('DEFAULT', 'GOOGLE');

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "accountType" "AccountType" NOT NULL DEFAULT 'DEFAULT';
