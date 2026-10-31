#include <jni.h>
#import <Foundation/Foundation.h>

int libjglios_verify_angle_profile(int argc, char **argv);
int libjglios_verify_angle_culling(int argc, char **argv);

extern "C" JNIEXPORT jint JNICALL
Java_org_ngengine_libjglios_sample_GLES31Verification_verifyBackend(JNIEnv *, jclass) {
    char executable[] = "libjglios-angle-profile";
    char profile[] = "gles31";
    char *profileArguments[] = {executable, profile, nullptr};
    int status = libjglios_verify_angle_profile(2, profileArguments);
    if (status != 0) {
        return status;
    }
    NSString *documents = NSSearchPathForDirectoriesInDomains(
        NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *image = [documents stringByAppendingPathComponent:@"angle-culling.ppm"];
    char cullingExecutable[] = "libjglios-angle-culling";
    char *cullingArguments[] = {
        cullingExecutable, const_cast<char *>(image.fileSystemRepresentation), nullptr};
    return libjglios_verify_angle_culling(2, cullingArguments);
}
