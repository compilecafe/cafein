import { db } from '../db';
import { sessionsTable, usersTable, type InsertSession } from '../db/schema';
import { and, desc, eq, gt } from 'drizzle-orm';

export const getActiveSessionsForUser = async (userId: string) => {
	const result = await db
		.select()
		.from(sessionsTable)
		.where(
			and(
				eq(sessionsTable.revoked, false),
				gt(sessionsTable.expiresAt, new Date()),
				eq(sessionsTable.userId, userId)
			)
		)
		.orderBy(desc(sessionsTable.createdAt));
	return result;
};

export const createSession = async (session: InsertSession) => {
	const result = await db.insert(sessionsTable).values(session).returning();
	return result[0];
};

export const getUserBySession = async (token: string) => {
	const [result] = await db
		.select()
		.from(sessionsTable)
		.where(
			and(
				eq(sessionsTable.token, token),
				eq(sessionsTable.revoked, false),
				gt(sessionsTable.expiresAt, new Date())
			)
		)
		.innerJoin(usersTable, eq(sessionsTable.userId, usersTable.id));
	return result;
};
