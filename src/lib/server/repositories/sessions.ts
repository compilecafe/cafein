import { eq } from 'drizzle-orm';
import { db } from '../db';
import { sessionsTable, usersTable, type InsertSession } from '../db/schema';

export const createSession = async (session: InsertSession) => {
	const result = await db.insert(sessionsTable).values(session).returning();
	return result[0];
};

export const getUserBySession = async (token: string) => {
	const [result] = await db
		.select()
		.from(sessionsTable)
		.where(eq(sessionsTable.token, token))
		.innerJoin(usersTable, eq(sessionsTable.userId, usersTable.id));
	return result.users;
};
