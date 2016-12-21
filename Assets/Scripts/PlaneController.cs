using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class PlaneController : MonoBehaviour {

	public MeshFilter meshFilter;
	public MeshRenderer meshRenderer;
	public MeshCollider meshCollider;
	[Range(32, 248)]
	public int segments = 62;

	void Update () {
		MeshData meshData = MeshGenerator.GenerateTerrainMesh (segments, segments);

		meshFilter.sharedMesh = meshData.CreateMesh ();
		meshCollider.sharedMesh = meshFilter.sharedMesh;
	}
}
