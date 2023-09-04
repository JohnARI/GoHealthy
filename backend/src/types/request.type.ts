import { Prisma } from '@prisma/client';

export type RequestWithUserUniqueInput = Request & {
  user: Prisma.UserWhereUniqueInput;
};
