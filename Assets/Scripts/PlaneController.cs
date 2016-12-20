using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class PlaneController : MonoBehaviour {

	public MeshFilter meshFilter;
	public MeshRenderer meshRenderer;
	[Range(32, 248)]
	public int size = 62;

	void Update () {
		MeshData meshData = MeshGenerator.GenerateTerrainMesh (size, size);

		meshFilter.sharedMesh = meshData.CreateMesh ();
	}
}
