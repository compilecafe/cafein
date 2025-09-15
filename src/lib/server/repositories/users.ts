import { eq } from 'drizzle-orm';
import { db } from '../db';
import { usersTable, type InsertUser } from '../db/schema';
import { hashPassword } from '../utils/password';

export const createUser = async (user: InsertUser) => {
	const result = await db
		.insert(usersTable)
		.values({
			...user,
			password: await hashPassword(user.password)
		})
		.returning();
	return result[0];
};

export const checkUsername = async (username: string) => {
	const result = await db
		.select({
			id: usersTable.id
		})
		.from(usersTable)
		.where(eq(usersTable.username, username))
		.limit(1);

	return result.length > 0;
};
