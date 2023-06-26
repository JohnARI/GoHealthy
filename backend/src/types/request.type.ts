import { Prisma } from '@prisma/client';

export type RequestWithUserIniqueInput = Request & {
  user: Prisma.UserWhereUniqueInput;
};
