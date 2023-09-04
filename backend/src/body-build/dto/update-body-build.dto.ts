import { PartialType } from '@nestjs/swagger';
import { CreateBodyBuildDto } from './create-body-build.dto';

export class UpdateBodyBuildDto extends PartialType(CreateBodyBuildDto) {}
