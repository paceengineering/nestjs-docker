import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

/**
 * @return {Promise.<void>}
 */
async function bootstrap(): Promise<void> {
  const app = await NestFactory.create(AppModule);
  await app.listen(3000);
}
bootstrap();
