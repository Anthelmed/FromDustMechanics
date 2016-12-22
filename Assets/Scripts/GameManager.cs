using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class GameController {
	private static float entityScale = 0f;
	private static float maxEntityScale = 10f;

	public static float getEntityScale() {
		return entityScale;
	}

	public static float getMaxEntityScale() {
		return maxEntityScale;
	}

	public static void incrementEntityScale() {
		entityScale += 0.5f;
	}

	public static void decrementEntityScale() {
		entityScale -= 0.5f;
	}
}
