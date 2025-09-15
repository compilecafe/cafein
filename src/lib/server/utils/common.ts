import { randomBytes } from 'crypto';

export function generateRandomString(length: number = 32): string {
	return randomBytes(length).toString('hex');
}
