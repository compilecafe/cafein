import { db } from '../db';
import { sessionsTable, type InsertSession } from '../db/schema';

export const createSession = async (session: InsertSession) => {
	const result = await db.insert(sessionsTable).values(session).returning();
	return result[0];
};
