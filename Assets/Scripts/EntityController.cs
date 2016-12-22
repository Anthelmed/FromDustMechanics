using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EntityController : MonoBehaviour {

	public GameObject flyingEntity;
	public ParticleSystem dust;

	void Update () {
		RaycastHit hit;
		Vector3 cursorPos = new Vector3 (Input.mousePosition.x, Input.mousePosition.y, 0.0f);
		Ray cursorRay = Camera.main.ScreenPointToRay (cursorPos);
		if (Physics.Raycast (cursorRay, out hit, 200)) {
			transform.position = hit.point;
		}

		float entityScale = GameController.getEntityScale ();

		Vector3 newScale = new Vector3 (entityScale, entityScale, entityScale);
		float newRadius = entityScale / 2 + 0.5f;
		float newStartSize = entityScale / 2 + 0.2f;

		if (flyingEntity.transform.localScale != newScale) {
			flyingEntity.transform.localScale = newScale;	
		}

		var main = dust.main;
		var shape = dust.shape;
		if (shape.radius != newRadius) {
			shape.enabled = true;
			shape.radius = newRadius;
			main.startSize = newStartSize;
		}
	}
}
