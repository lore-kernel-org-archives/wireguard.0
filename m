Return-Path: lists@lonnie.abelbeck.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 964d6098
 for <wireguard@lists.zx2c4.com>; Thu, 7 Dec 2017 15:24:54 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 88ff9e01
 for <wireguard@lists.zx2c4.com>; Thu, 7 Dec 2017 15:24:54 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id B289E11661
 for <wireguard@lists.zx2c4.com>; Thu,  7 Dec 2017 10:31:56 -0500 (EST)
Received: from macpro.priv.abelbeck.com (wsip-70-165-110-240.om.om.cox.net
 [70.165.110.240])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id 3124C1165F
 for <wireguard@lists.zx2c4.com>; Thu,  7 Dec 2017 10:31:55 -0500 (EST)
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
Content-Type: multipart/mixed;
 boundary="Apple-Mail=_B6D7B881-4912-4523-950D-6945AEF2E7C1"
Subject: [patch] wg: add support for peer names using a file in userspace
Message-Id: <4B7E0154-039F-4008-9C47-C825E1474731@lonnie.abelbeck.com>
Date: Thu, 7 Dec 2017 09:31:54 -0600
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--Apple-Mail=_B6D7B881-4912-4523-950D-6945AEF2E7C1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Enclosed is a patch: wg: add support for peer names using a file in =
userspace

Disabled by default, build with WITH_PEERDATA=3Dyes to enable peer name =
support.

Config [Peer] sections can optionally be [Peer-custom_name] with "show" =
and "showconf"
displaying the "peer-custom_name" label.  Spaces are ignored.

The data file location is PEERDATAFILE, which defaults to =
/var/run/wg.peerdata

Comments are appreciated.

Lonnie


--Apple-Mail=_B6D7B881-4912-4523-950D-6945AEF2E7C1
Content-Disposition: attachment;
	filename=0001-wg-add-support-for-peer-names.patch
Content-Type: application/octet-stream;
	name="0001-wg-add-support-for-peer-names.patch"
Content-Transfer-Encoding: quoted-printable

=46rom=2002eb8daf8c158700a94cec894434dce629962483=20Mon=20Sep=2017=20=
00:00:00=202001=0AFrom:=20Lonnie=20Abelbeck=20<lonnie@abelbeck.com>=0A=
Date:=20Thu,=207=20Dec=202017=2009:07:34=20-0600=0ASubject:=20[PATCH=20=
1/1]=20wg:=20add=20support=20for=20peer=20names=20using=20a=20file=20in=20=
userspace=0A=0ADisabled=20by=20default,=20build=20with=20=
WITH_PEERDATA=3Dyes=20to=20enable=20peer=20name=20support.=0A=0AConfig=20=
[Peer]=20sections=20can=20optionally=20be=20[Peer-custom_name]=20with=20=
show=20and=20showconf=0A=0Adisplaying=20the=20peer-custom_name=20label.=20=
=20Spaces=20are=20ignored.=0A=0AThe=20data=20file=20location=20is=20=
PEERDATAFILE,=20which=20defaults=20to=20/var/run/wg.peerdata=0A---=0A=20=
src/tools/Makefile=20=20=20|=20=20=205=20+++=0A=20src/tools/config.c=20=20=
=20|=20=2033=20+++++++++++++++-=0A=20src/tools/peerdata.c=20|=20104=20=
+++++++++++++++++++++++++++++++++++++++++++++++++++=0A=20=
src/tools/peerdata.h=20|=20=2020=20++++++++++=0A=20src/tools/show.c=20=20=
=20=20=20|=20=20=207=20++++=0A=20src/tools/showconf.c=20|=20=20=206=20=
+++=0A=206=20files=20changed,=20173=20insertions(+),=202=20deletions(-)=0A=
=20create=20mode=20100644=20src/tools/peerdata.c=0A=20create=20mode=20=
100644=20src/tools/peerdata.h=0A=0Adiff=20--git=20a/src/tools/Makefile=20=
b/src/tools/Makefile=0Aindex=20e277b2f..761ee2a=20100644=0A---=20=
a/src/tools/Makefile=0A+++=20b/src/tools/Makefile=0A@@=20-12,9=20+12,11=20=
@@=20MANDIR=20?=3D=20$(PREFIX)/share/man=0A=20BASHCOMPDIR=20?=3D=20=
$(PREFIX)/share/bash-completion/completions=0A=20SYSTEMDUNITDIR=20?=3D=20=
$(shell=20$(PKG_CONFIG)=20--variable=3Dsystemdsystemunitdir=20systemd=20=
2>/dev/null=20||=20echo=20"$(PREFIX)/lib/systemd/system")=0A=20=
RUNSTATEDIR=20?=3D=20/var/run=0A+PEERDATAFILE=20?=3D=20=
/var/run/wg.peerdata=0A=20WITH_BASHCOMPLETION=20?=3D=0A=20WITH_WGQUICK=20=
?=3D=0A=20WITH_SYSTEMDUNITS=20?=3D=0A+WITH_PEERDATA=20?=3D=0A=20=0A=20=
ifeq=20($(WITH_BASHCOMPLETION),)=0A=20ifneq=20($(strip=20$(wildcard=20=
$(BASHCOMPDIR))),)=0A@@=20-40,6=20+42,9=20@@=20CFLAGS=20+=3D=20=
-std=3Dgnu11=20-D_GNU_SOURCE=0A=20CFLAGS=20+=3D=20-Wall=20-Wextra=0A=20=
CFLAGS=20+=3D=20-MMD=20-MP=0A=20CFLAGS=20+=3D=20=
-DRUNSTATEDIR=3D"\"$(RUNSTATEDIR)\""=0A+ifeq=20($(WITH_PEERDATA),yes)=0A=
+CFLAGS=20+=3D=20-DPEERDATA=20-DPEERDATAFILE=3D"\"$(PEERDATAFILE)\""=0A=
+endif=0A=20ifeq=20($(DEBUG_TOOLS),y)=0A=20CFLAGS=20+=3D=20-g=0A=20endif=0A=
diff=20--git=20a/src/tools/config.c=20b/src/tools/config.c=0Aindex=20=
1fddb64..6077a6b=20100644=0A---=20a/src/tools/config.c=0A+++=20=
b/src/tools/config.c=0A@@=20-19,6=20+19,7=20@@=0A=20#include=20=
"containers.h"=0A=20#include=20"ipc.h"=0A=20#include=20"encoding.h"=0A=
+#include=20"peerdata.h"=0A=20=0A=20#define=20COMMENT_CHAR=20'#'=0A=20=0A=
@@=20-358,7=20+359,13=20@@=20static=20bool=20process_line(struct=20=
config_ctx=20*ctx,=20const=20char=20*line)=0A=20=09=09=
ctx->is_device_section=20=3D=20true;=0A=20=09=09return=20true;=0A=20=09}=0A=
+#ifdef=20PEERDATA=0A+=09static=20char=20peer_name[WG_PEERDATA_MAXLEN];=0A=
+=09bool=20is_peername=20=3D=20!strncasecmp(line,=20"[Peer-",=206)=20&&=20=
line[strlen(line)=20-=201]=20=3D=3D=20']';=0A+=09if=20(!strcasecmp(line,=20=
"[Peer]")=20||=20is_peername)=20{=0A+#else=0A=20=09if=20=
(!strcasecmp(line,=20"[Peer]"))=20{=0A+#endif=0A=20=09=09struct=20wgpeer=20=
*new_peer=20=3D=20calloc(1,=20sizeof(struct=20wgpeer));=0A=20=0A=20=09=09=
if=20(!new_peer)=20{=0A@@=20-374,6=20+381,15=20@@=20static=20bool=20=
process_line(struct=20config_ctx=20*ctx,=20const=20char=20*line)=0A=20=09=
=09ctx->is_peer_section=20=3D=20true;=0A=20=09=09ctx->is_device_section=20=
=3D=20false;=0A=20=09=09ctx->last_peer->flags=20|=3D=20=
WGPEER_REPLACE_ALLOWEDIPS;=0A+#ifdef=20PEERDATA=0A+=09=09if=20=
(is_peername)=20{=0A+=09=09=09strncpy(peer_name,=20line=20+=206,=20=
WG_PEERDATA_MAXLEN);=09/*=20jump=20over=20"[Peer-"=20*/=0A+=09=09=09=
peer_name[WG_PEERDATA_MAXLEN=20-=201]=20=3D=20'\0';=0A+=09=09=09=
peer_name[strlen(peer_name)=20-=201]=20=3D=20'\0';=09=09=09/*=20=
overwrite=20last=20character=20']'=20*/=0A+=09=09}=20else=20{=0A+=09=09=09=
peer_name[0]=20=3D=20'\0';=0A+=09=09}=0A+#endif=0A=20=09=09return=20=
true;=0A=20=09}=0A=20=0A@@=20-395,8=20+411,17=20@@=20static=20bool=20=
process_line(struct=20config_ctx=20*ctx,=20const=20char=20*line)=0A=20=09=
=09=09ret=20=3D=20parse_endpoint(&ctx->last_peer->endpoint.addr,=20=
value);=0A=20=09=09else=20if=20(key_match("PublicKey"))=20{=0A=20=09=09=09=
ret=20=3D=20parse_key(ctx->last_peer->public_key,=20value);=0A-=09=09=09=
if=20(ret)=0A+=09=09=09if=20(ret)=20{=0A=20=09=09=09=09=
ctx->last_peer->flags=20|=3D=20WGPEER_HAS_PUBLIC_KEY;=0A+#ifdef=20=
PEERDATA=0A+=09=09=09=09if=20(peer_name[0])=20{=0A+=09=09=09=09=09static=20=
char=20base64[WG_KEY_LEN_BASE64];=0A+=09=09=09=09=09=
key_to_base64(base64,=20ctx->last_peer->public_key);=0A+=09=09=09=09=09=
file_put_peerdata(base64,=20"name",=20peer_name);=0A+=09=09=09=09=09=
peer_name[0]=20=3D=20'\0';=0A+=09=09=09=09}=0A+#endif=0A+=09=09=09}=0A=20=
=09=09}=20else=20if=20(key_match("AllowedIPs"))=0A=20=09=09=09ret=20=3D=20=
parse_allowedips(ctx->last_peer,=20&ctx->last_allowedip,=20value);=0A=20=09=
=09else=20if=20(key_match("PersistentKeepalive"))=0A@@=20-455,8=20=
+480,12=20@@=20bool=20config_read_init(struct=20config_ctx=20*ctx,=20=
bool=20append)=0A=20=09=09perror("calloc");=0A=20=09=09return=20false;=0A=
=20=09}=0A-=09if=20(!append)=0A+=09if=20(!append)=20{=0A=20=09=09=
ctx->device->flags=20|=3D=20WGDEVICE_REPLACE_PEERS=20|=20=
WGDEVICE_HAS_PRIVATE_KEY=20|=20WGDEVICE_HAS_FWMARK=20|=20=
WGDEVICE_HAS_LISTEN_PORT;=0A+#ifdef=20PEERDATA=0A+=09=09=
file_init_peerdata();=0A+#endif=0A+=09}=0A=20=09return=20true;=0A=20}=0A=20=
=0Adiff=20--git=20a/src/tools/peerdata.c=20b/src/tools/peerdata.c=0Anew=20=
file=20mode=20100644=0Aindex=200000000..9bd7871=0A---=20/dev/null=0A+++=20=
b/src/tools/peerdata.c=0A@@=20-0,0=20+1,104=20@@=0A+/*=20=
SPDX-License-Identifier:=20GPL-2.0=0A+=20*=0A+=20*=20Copyright=20(C)=20=
2015-2017=20Jason=20A.=20Donenfeld=20<Jason@zx2c4.com>.=20All=20Rights=20=
Reserved.=0A+=20*/=0A+=0A+#ifdef=20PEERDATA=0A+=0A+#include=20<stdio.h>=0A=
+#include=20<stdlib.h>=0A+#include=20<string.h>=0A+#include=20<errno.h>=0A=
+=0A+#include=20"peerdata.h"=0A+=0A+bool=20file_init_peerdata(void)=0A+{=0A=
+=09FILE=20*f;=0A+=09bool=20ret=20=3D=20true;=0A+=0A+=09f=20=3D=20=
fopen(WG_PEERDATA_FILE,=20"r");=0A+=09if=20(f)=20{=0A+=09=09fclose(f);=0A=
+=09=09if=20(remove(WG_PEERDATA_FILE))=20{=0A+=09=09=09perror("remove");=0A=
+=09=09=09ret=20=3D=20false;=0A+=09=09}=0A+=09}=0A+=09return=20ret;=0A+}=0A=
+=0A+bool=20file_put_peerdata(const=20char=20*pubkey,=20const=20char=20=
*type,=20const=20char=20*data)=0A+{=0A+=09FILE=20*f;=0A+=09char=20=
*buffer;=0A+=09size_t=20buffer_len=20=3D=20strlen(pubkey)=20+=20=
strlen(type)=20+=20strlen(data)=20+=204;=0A+=09bool=20ret=20=3D=20false;=0A=
+=0A+=09f=20=3D=20fopen(WG_PEERDATA_FILE,=20"a");=0A+=09if=20(!f)=20{=0A=
+=09=09perror("fopen");=0A+=09=09return=20false;=0A+=09}=0A+=0A+=09=
buffer=20=3D=20calloc(buffer_len,=20sizeof(char));=0A+=09if=20(!buffer)=20=
{=0A+=09=09perror("calloc");=0A+=09=09fclose(f);=0A+=09=09return=20=
false;=0A+=09}=0A+=0A+=09snprintf(buffer,=20buffer_len,=20"%s,%s,%s\n",=20=
pubkey,=20type,=20data);=0A+=09if=20(fwrite(buffer,=20strlen(buffer),=20=
1,=20f)=20!=3D=201)=20{=0A+=09=09if=20(errno)=20{=0A+=09=09=09=
perror("fwrite");=0A+=09=09}=0A+=09=09goto=20out;=0A+=09}=0A+=09ret=20=3D=20=
true;=0A+=0A+out:=0A+=09fclose(f);=0A+=09free(buffer);=0A+=09return=20=
ret;=0A+}=0A+=0A+char=20*file_get_peerdata(const=20char=20*pubkey,=20=
const=20char=20*type)=0A+{=0A+=09static=20char=20=
data[WG_PEERDATA_MAXLEN];=0A+=09char=20*data_rtn=20=3D=20NULL;=0A+=09=
FILE=20*f;=0A+=09char=20*buffer=20=3D=20NULL;=0A+=09size_t=20buffer_len=20=
=3D=200;=0A+=09char=20*line,=20*token;=0A+=0A+=09f=20=3D=20=
fopen(WG_PEERDATA_FILE,=20"r");=0A+=09if=20(!f)=20{=0A+=09=09return=20=
NULL;=0A+=09}=0A+=0A+=09while=20(getline(&buffer,=20&buffer_len,=20f)=20=
>=3D=200)=20{=0A+=09=09line=20=3D=20buffer;=0A+=09=09if=20((token=20=3D=20=
strsep(&line,=20",")))=20{=0A+=09=09=09if=20(!strcmp(token,=20pubkey))=20=
{=0A+=09=09=09=09if=20((token=20=3D=20strsep(&line,=20",")))=20{=0A+=09=09=
=09=09=09if=20(!strcmp(token,=20type))=20{=0A+=09=09=09=09=09=09if=20=
((token=20=3D=20strsep(&line,=20"\n")))=20{=0A+=09=09=09=09=09=09=09=
strncpy(data,=20token,=20WG_PEERDATA_MAXLEN);=0A+=09=09=09=09=09=09=09=
data[WG_PEERDATA_MAXLEN=20-=201]=20=3D=20'\0';=0A+=09=09=09=09=09=09=09=
data_rtn=20=3D=20data;=0A+=09=09=09=09=09=09=09goto=20out;=0A+=09=09=09=09=
=09=09}=0A+=09=09=09=09=09}=0A+=09=09=09=09}=0A+=09=09=09}=0A+=09=09}=0A=
+=09}=0A+=0A+out:=0A+=09fclose(f);=0A+=09free(buffer);=0A+=09return=20=
data_rtn;=0A+}=0A+=0A+#endif=0Adiff=20--git=20a/src/tools/peerdata.h=20=
b/src/tools/peerdata.h=0Anew=20file=20mode=20100644=0Aindex=20=
0000000..42380f0=0A---=20/dev/null=0A+++=20b/src/tools/peerdata.h=0A@@=20=
-0,0=20+1,20=20@@=0A+/*=20SPDX-License-Identifier:=20GPL-2.0=0A+=20*=0A+=20=
*=20Copyright=20(C)=202015-2017=20Jason=20A.=20Donenfeld=20=
<Jason@zx2c4.com>.=20All=20Rights=20Reserved.=0A+=20*/=0A+=0A+#ifndef=20=
PEERDATA_H=0A+#define=20PEERDATA_H=0A+=0A+#ifdef=20PEERDATA=0A+#define=20=
WG_PEERDATA_FILE=20PEERDATAFILE=0A+#define=20WG_PEERDATA_MAXLEN=2064=0A+=0A=
+#include=20<stdbool.h>=0A+=0A+bool=20file_init_peerdata(void);=0A+bool=20=
file_put_peerdata(const=20char=20*pubkey,=20const=20char=20*type,=20=
const=20char=20*data);=0A+char=20*file_get_peerdata(const=20char=20=
*pubkey,=20const=20char=20*type);=0A+#endif=0A+=0A+#endif=0Adiff=20--git=20=
a/src/tools/show.c=20b/src/tools/show.c=0Aindex=20c5be788..bb37463=20=
100644=0A---=20a/src/tools/show.c=0A+++=20b/src/tools/show.c=0A@@=20=
-21,6=20+21,7=20@@=0A=20#include=20"terminal.h"=0A=20#include=20=
"encoding.h"=0A=20#include=20"subcommands.h"=0A+#include=20"peerdata.h"=0A=
=20=0A=20static=20int=20peer_cmp(const=20void=20*first,=20const=20void=20=
*second)=0A=20{=0A@@=20-222,7=20+223,13=20@@=20static=20void=20=
pretty_print(struct=20wgdevice=20*device)=0A=20=09=09=
terminal_printf("\n");=0A=20=09}=0A=20=09for_each_wgpeer(device,=20peer)=20=
{=0A+#ifdef=20PEERDATA=0A+=09=09char=20*pubkey=20=3D=20=
key(peer->public_key);=0A+=09=09char=20*peerdata=20=3D=20=
file_get_peerdata(pubkey,=20"name");=0A+=09=09=
terminal_printf(TERMINAL_FG_YELLOW=20TERMINAL_BOLD=20"peer%s%s"=20=
TERMINAL_RESET=20":=20"=20TERMINAL_FG_YELLOW=20"%s"=20TERMINAL_RESET=20=
"\n",=20(peerdata=20?=20"-"=20:=20""),=20(peerdata=20?=20peerdata=20:=20=
""),=20pubkey);=0A+#else=0A=20=09=09terminal_printf(TERMINAL_FG_YELLOW=20=
TERMINAL_BOLD=20"peer"=20TERMINAL_RESET=20":=20"=20TERMINAL_FG_YELLOW=20=
"%s"=20TERMINAL_RESET=20"\n",=20key(peer->public_key));=0A+#endif=0A=20=09=
=09if=20(peer->flags=20&=20WGPEER_HAS_PRESHARED_KEY)=0A=20=09=09=09=
terminal_printf("=20=20"=20TERMINAL_BOLD=20"preshared=20key"=20=
TERMINAL_RESET=20":=20%s\n",=20masked_key(peer->preshared_key));=0A=20=09=
=09if=20(peer->endpoint.addr.sa_family=20=3D=3D=20AF_INET=20||=20=
peer->endpoint.addr.sa_family=20=3D=3D=20AF_INET6)=0Adiff=20--git=20=
a/src/tools/showconf.c=20b/src/tools/showconf.c=0Aindex=20=
2e3fbd4..443bccc=20100644=0A---=20a/src/tools/showconf.c=0A+++=20=
b/src/tools/showconf.c=0A@@=20-16,6=20+16,7=20@@=0A=20#include=20=
"encoding.h"=0A=20#include=20"ipc.h"=0A=20#include=20"subcommands.h"=0A=
+#include=20"peerdata.h"=0A=20=0A=20int=20showconf_main(int=20argc,=20=
char=20*argv[])=0A=20{=0A@@=20-48,7=20+49,12=20@@=20int=20=
showconf_main(int=20argc,=20char=20*argv[])=0A=20=09printf("\n");=0A=20=09=
for_each_wgpeer(device,=20peer)=20{=0A=20=09=09key_to_base64(base64,=20=
peer->public_key);=0A+#ifdef=20PEERDATA=0A+=09=09char=20*peerdata=20=3D=20=
file_get_peerdata(base64,=20"name");=0A+=09=09=
printf("[Peer%s%s]\nPublicKey=20=3D=20%s\n",=20(peerdata=20?=20"-"=20:=20=
""),=20(peerdata=20?=20peerdata=20:=20""),=20base64);=0A+#else=0A=20=09=09=
printf("[Peer]\nPublicKey=20=3D=20%s\n",=20base64);=0A+#endif=0A=20=09=09=
if=20(peer->flags=20&=20WGPEER_HAS_PRESHARED_KEY)=20{=0A=20=09=09=09=
key_to_base64(base64,=20peer->preshared_key);=0A=20=09=09=09=
printf("PresharedKey=20=3D=20%s\n",=20base64);=0A--=20=0A1.8.3.1=0A=0A=

--Apple-Mail=_B6D7B881-4912-4523-950D-6945AEF2E7C1
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii




--Apple-Mail=_B6D7B881-4912-4523-950D-6945AEF2E7C1--
