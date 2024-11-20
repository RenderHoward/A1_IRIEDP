#ifndef IRISUB_H
#define IRISUB_H
int iri_sub_c(int (*jf)[50], int *jmag, float *lat, float *lon, int *yyyy, int *mmdd /* -ddd */, float *hour,
                float *height_begin, float *height_end, float *height_step, float (*out_array)[1000][20], float (*out_list)[100] );

typedef
struct heightData_t
{
    double min, max;
    int num_samples;
    float values[100];
} HeightData;

int edp( float lat, float lon, int yyyy, int mm, int dd, float hour, HeightData * const data  );

int launchplot( HeightData const * const data, char const * const legend_str );

#endif // IRISUB_H
