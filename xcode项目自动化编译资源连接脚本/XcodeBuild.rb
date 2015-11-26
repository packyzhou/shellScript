require File.expand_path('../src/com/sise/framework/ruby/pbxplorer.rb', __FILE__)

class XcodeBuild
#fileType {image.png->图片,archive.ar->静态库,sourcecode.c.h->.h头文件,sourcecode.c.objc->.m头文件,text.plist.xml->xml文件,file.xib->xib文件,file->nib文件}
  def self.addResource(pjPath,addFile,fileType)
    
    fb = XCProjectFile.new pjPath
    file_ref = fb.new_object PBXFileReference, { "path" => addFile, "sourceTree" => "<group>",  "lastKnownFileType" => fileType }
    build_file = fb.new_object PBXBuildFile, { "fileRef" => file_ref.uuid }

    build_phases = fb.objects_of_class PBXResourcesBuildPhase
    build_phases.each { |phase| phase["files"] << build_file.uuid }

    fb.save
    "add >>> PROJ:#{pjPath} [+] #{addFile} [type:#{fileType}]"
  end

  def self.addFramework(pjPath,addFile,fileType)
    
    fb = XCProjectFile.new pjPath
    file_ref = fb.new_object PBXFileReference, { "path" => addFile, "sourceTree" => "<group>",  "lastKnownFileType" => fileType }
    build_file = fb.new_object PBXBuildFile, { "fileRef" => file_ref.uuid }

    build_phases = fb.objects_of_class PBXFrameworksBuildPhase
    build_phases.each { |phase| phase["files"] << build_file.uuid }

    fb.save
    "add >>> PROJ:#{pjPath} [+] #{addFile} [type:#{fileType}]"
  end
  
  def self.test(pjPath,addFile,fileType)
    puts "projectPath : #{pjPath}"
    puts "filePath : #{addFile}"
    puts "fileType : #{fileType}"
  end
end

def shareRuby
  XcodeBuild
end
