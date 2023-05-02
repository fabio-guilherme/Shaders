using UnityEngine;

public class ExtrusionAnimator : MonoBehaviour
{
    public bool animate = false;
    private float startTime;
    private Renderer render;

    void Start()
    {
        render = GetComponent<Renderer>();
        startTime = Time.time;
    }

    void Update()
    {
        if (animate)
        {
            render.material.SetFloat("_ExtrudeAmount", Time.time - startTime);
        }
        else
        {
            render.material.SetFloat("_ExtrudeAmount", 0);
            startTime = Time.time;
        }
    }
}