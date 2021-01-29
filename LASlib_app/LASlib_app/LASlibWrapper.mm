//
//  LASlibWrapper.m
//  LASlib_app
//
//  Created by Kenneth Schröder on 29.01.21.
//

#import <Foundation/Foundation.h>

#import "LASlibWrapper.h"
#include "laspoint.hpp"
#include "lasreader.hpp"
#include "laswriter.hpp" // can import here, in Objective-C++ code

// Use an extension on LASwriter_oc because we need to use LASwriter,
// but we couldn't do it in LAStoolsWrapper.h,
// which is visible from Swift and thus can't contain C++ stuff.
@interface LASwriter_oc ()
{
    LASwriter* lasWriter;
    LASheader header;
    LASwriteOpener writeOpener;
}
@end

@implementation LASwriter_oc

-(void)write_cloud:(char *)name
{
    
    writeOpener.set_file_name(name);
    
    // LAS format https://www.asprs.org/a/society/committees/standards/asprs_las_format_v12.pdf
    //header.file_signature
    //strcpy( header.file_signature, "LASF" );
    header.file_source_ID = 0; // processing software is free to assign any valid number
    // (*header).global_encoding = 0; // GPS Time Type "not set"
    
    // (*header).version_major = 1;
    // (*header).version_minor = 2; // indicating LAS version
    
    // strcpy( (*header).system_identifier, "APPLE" );
    // strcpy( (*header).generating_software, "ARKit4" ); // might not need those
    
    // (*header).header_size;
    // (*header).offset_to_point_data; // number of bytes from beginning of file until point data starts
    // (*header).number_of_variable_length_records;
    header.point_data_format = 2;  // contains color channels for each point
    // (*header).point_data_record_length;
    // (*header).number_of_point_records; // set this dynamically, might not need this
    // (*header).number_of_points_by_return; // might not need this
    header.x_scale_factor = 0.001; // coordinates are stored as longs, need to specify a scaling factor here
    header.y_scale_factor = 0.001;
    header.z_scale_factor = 0.001;
    
    header.x_offset = 0;
    header.y_offset = 0;
    header.z_offset = 0;
    
    //(*header).max_x; // might not need those
    //(*header).max_y;
    //(*header).max_z;
    //(*header).min_x;
    //(*header).min_y;
    //(*header).min_z;
    
    //lasWriter = writeOpener.open(&header);
    
    //if (!lasWriter)
    //{
        // printf("Something went wrong when trying to write the file");
        // throw std::runtime_error(tr("Cannot open file '%1' for writing.").arg(filename).toStdString());
    //}
    
    
    /*LASpoint lasPoint;
    lasPoint.init(&header, header.point_data_format, header.point_data_record_length, &header);
    
    for(int i = 0; i < length; i++)
    {
        lasPoint.set_R(100); // const U16 -> 2 Byte unsinged int -> 0-65536 ?
        lasPoint.set_G(100);
        lasPoint.set_B(100);
        
        //lasPoint.set_X((xyzMemory[i].x + lasShift.x) / lasHeader.x_scale_factor);
        lasPoint.set_X((points[i].position[0] + header.x_offset ) / header.x_scale_factor);
        lasPoint.set_Y((points[i].position[1] + header.y_offset ) / header.y_scale_factor);
        lasPoint.set_Z((points[i].position[2] + header.z_offset ) / header.z_scale_factor);
        
        lasWriter->write_point(&lasPoint);
        lasWriter->update_inventory(&lasPoint);
    }
    
    lasWriter->close(); */
}

@end
