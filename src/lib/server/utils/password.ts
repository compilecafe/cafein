import { PASSWORD_PEPPER } from '$env/static/private';
import argon2 from 'argon2';

export const hashPassword = async (password: string) =>
	await argon2.hash(password + PASSWORD_PEPPER, {
		type: argon2.argon2id,
		memoryCost: 2 ** 18,
		timeCost: 5,
		parallelism: 4
	});

export const verifyPassword = async (hash: string, password: string) =>
	await argon2.verify(hash, password + PASSWORD_PEPPER);
