Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8642CCFA13
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 May 2026 13:31:17 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b417d9e0;
	Fri, 1 May 2026 13:31:16 +0000 (UTC)
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id b9fde321
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 1 May 2026 13:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1777642273; x=1777901473;
 bh=Gp3W95R1WkY6QRcunIamhHGRojT6wNbDiR1bqC8NrX4=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=ZN/5kZr55qZGHWyQH9znGnGOEsOyiqSo5kzINSLU9+iattZGGwA+K0MArtY5EeDHl
 HR9Nuictp6N7uX2kLjsmhr0F+rCg8lhLazmlTAQsWxvMt0KWi1B+OUNkQZTSgr5wWl
 JeW4gSQgknc46pf8znRz7MF0qaFsVoOg9JwvZtm9Ry+MyRpqv6z/UnlRM3trlGedwp
 UgZF4ZRekPhMxyEk96HuZT6BoqfxQ39S48jgaT8g1m40VP085KBiu0I6fH8GFCKBse
 xyisF0eGYFg0vzJ2mQY3AZD321BopDpA8OwKfk+6vWjmvuMKNA54o2rnwpX5Z28clH
 ouz0Z1z+fJtSA==
Date: Fri, 01 May 2026 13:31:08 +0000
To: wireguard@lists.zx2c4.com
From: Sybil Isabel Dorsett <sybdorsett@proton.me>
Subject: [PATCH v2] wg-quick: add SocketNamespace for UDP socket netns
Message-ID: <20260501133048.3630-1-sybdorsett@proton.me>
Feedback-ID: 131381098:user:proton
X-Pm-Message-ID: 57267123ff3c127eb500b1fbcbd9a2ec16e62437
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

wg-quick cannot express WireGuard's supported deployment model in
which the UDP socket resides in a different network namespace than
the interface. This model is documented and used in practice for
cases such as keeping routing policy and tunnel endpoints in separate
namespaces (e.g. container or policy isolation setups). Achieving this
today requires reimplementing substantial parts of wg-quick externally,
including interface lifecycle, address assignment, routing, and
teardown.

Add a SocketNamespace option to select the network namespace in which
the WireGuard UDP socket is created, while keeping the interface in
the invoking namespace. Create the interface in the target namespace
so that sockets are bound there, then move it back to the caller's
namespace before executing PreUp hooks.

Limit the scope to selecting the socket namespace only, without
introducing general network namespace management, persistent state,
or changes to default behavior.

Document SocketNamespace in the man page and update highlighters.

Signed-off-by: Sybil Isabel Dorsett <sybdorsett@proton.me>
---
v2:
- Resend for visibility; no functional changes
- Clarify commit message

Reference (earlier discussion on mailing list):
- https://lists.zx2c4.com/pipermail/wireguard/2020-March/005143.html

Implementation notes:
- Limit scope to socket namespace only (no general netns management)
- Return the interface to the caller namespace before hook execution
- Use PID-based netns targeting instead of fixed namespace IDs
- Ensure userspace fallback (wireguard-go) runs in SocketNamespace,
  preserving socket placement
- Prevent namespace errors from triggering kernel/userspace fallback
  paths

 contrib/highlighter/gui/highlight.cpp |  1 +
 contrib/highlighter/highlight.c       |  1 +
 contrib/highlighter/highlighter.c     | 23 +++++++++++++++++++++++
 contrib/highlighter/highlighter.h     |  1 +
 src/man/wg-quick.8                    |  5 +++++
 src/wg-quick/linux.bash               | 15 ++++++++++++---
 6 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/contrib/highlighter/gui/highlight.cpp b/contrib/highlighter/gu=
i/highlight.cpp
index a95857b..7c4e4ac 100644
--- a/contrib/highlighter/gui/highlight.cpp
+++ b/contrib/highlighter/gui/highlight.cpp
@@ -25,6 +25,7 @@ static QColor colormap[] =3D {
 =09[HighlightDelimiter] =3D QColor("#7aa6da"),
 #ifndef MOBILE_WGQUICK_SUBSET
 =09[HighlightTable] =3D QColor("#c397d8"),
+=09[HighlightSocketNamespace] =3D QColor("#c397d8"),
 =09[HighlightFwMark] =3D QColor("#c397d8"),
 =09[HighlightSaveConfig] =3D QColor("#c397d8"),
 =09[HighlightCmd] =3D QColor("#969896"),
diff --git a/contrib/highlighter/highlight.c b/contrib/highlighter/highligh=
t.c
index 8dc0d49..a18f039 100644
--- a/contrib/highlighter/highlight.c
+++ b/contrib/highlighter/highlight.c
@@ -51,6 +51,7 @@ static const char *colormap[] =3D {
 =09[HighlightDelimiter] =3D TERMINAL_FG_CYAN,
 #ifndef MOBILE_WGQUICK_SUBSET
 =09[HighlightTable] =3D TERMINAL_FG_BLUE,
+=09[HighlightSocketNamespace] =3D TERMINAL_FG_BLUE,
 =09[HighlightFwMark] =3D TERMINAL_FG_BLUE,
 =09[HighlightSaveConfig] =3D TERMINAL_FG_BLUE,
 =09[HighlightCmd] =3D TERMINAL_FG_WHITE,
diff --git a/contrib/highlighter/highlighter.c b/contrib/highlighter/highli=
ghter.c
index 3c34f1c..5264ac9 100644
--- a/contrib/highlighter/highlighter.c
+++ b/contrib/highlighter/highlighter.c
@@ -223,6 +223,24 @@ static bool is_valid_persistentkeepalive(string_span_t=
 s)
=20
 #ifndef MOBILE_WGQUICK_SUBSET
=20
+static bool is_valid_filename(string_span_t s)
+{
+=09if (s.len > 128 || !s.len)
+=09=09return false;
+=09if (s.len =3D=3D 1 && s.s[0] =3D=3D '.')
+=09=09return false;
+=09if (s.len =3D=3D 2 && s.s[0] =3D=3D '.' && s.s[1] =3D=3D '.')
+=09=09return false;
+=09if (s.s[0] =3D=3D '-')
+=09=09return false;
+=09for (size_t i =3D 0; i < s.len; ++i) {
+=09=09if (!is_alphabet(s.s[i]) && !is_decimal(s.s[i]) &&
+=09=09    s.s[i] !=3D '_' && s.s[i] !=3D '-' && s.s[i] !=3D '.')
+=09=09=09return false;
+=09}
+=09return true;
+}
+
 static bool is_valid_fwmark(string_span_t s)
 {
 =09if (is_same(s, "off"))
@@ -345,6 +363,7 @@ enum field {
 =09DNS,
 =09MTU,
 #ifndef MOBILE_WGQUICK_SUBSET
+=09SocketNamespace,
 =09FwMark,
 =09Table,
 =09PreUp, PostUp, PreDown, PostDown,
@@ -384,6 +403,7 @@ static enum field get_field(string_span_t s)
 =09check_enum(Endpoint);
 =09check_enum(PersistentKeepalive);
 #ifndef MOBILE_WGQUICK_SUBSET
+=09check_enum(SocketNamespace);
 =09check_enum(FwMark);
 =09check_enum(Table);
 =09check_enum(PreUp);
@@ -526,6 +546,9 @@ static void highlight_value(struct highlight_span_array=
 *ret, const string_span_
 =09case SaveConfig:
 =09=09append_highlight_span(ret, parent.s, s, is_valid_saveconfig(s) ? Hig=
hlightSaveConfig : HighlightError);
 =09=09break;
+=09case SocketNamespace:
+=09=09append_highlight_span(ret, parent.s, s, is_valid_filename(s) ? Highl=
ightSocketNamespace : HighlightError);
+=09=09break;
 =09case FwMark:
 =09=09append_highlight_span(ret, parent.s, s, is_valid_fwmark(s) ? Highlig=
htFwMark : HighlightError);
 =09=09break;
diff --git a/contrib/highlighter/highlighter.h b/contrib/highlighter/highli=
ghter.h
index ecbce00..d7d6600 100644
--- a/contrib/highlighter/highlighter.h
+++ b/contrib/highlighter/highlighter.h
@@ -21,6 +21,7 @@ enum highlight_type {
 =09HighlightDelimiter,
 #ifndef MOBILE_WGQUICK_SUBSET
 =09HighlightTable,
+=09HighlightSocketNamespace,
 =09HighlightFwMark,
 =09HighlightSaveConfig,
 =09HighlightCmd,
diff --git a/src/man/wg-quick.8 b/src/man/wg-quick.8
index bc9e145..1a7c9a6 100644
--- a/src/man/wg-quick.8
+++ b/src/man/wg-quick.8
@@ -102,6 +102,11 @@ the commands are executed in order.
 SaveConfig \(em if set to `true', the configuration is saved from the curr=
ent state of the
 interface upon shutdown. Any changes made to the configuration file before=
 the
 interface is removed will therefore be overwritten.
+.IP \(bu
+SocketNamespace \(em the name of an existing network namespace (netns)
+in which the interface's UDP sockets are created. If specified, the interf=
ace
+is first added to that netns, then moved to the invoking process's native =
netns
+before any other interface settings are applied.
=20
 .P
 Recommended \fIINTERFACE\fP names include `wg0' or `wgvpn0' or even `wgmgm=
tlan0'.
diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index 18e266c..1349d70 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -13,6 +13,7 @@ export PATH=3D"${SELF%/*}:$PATH"
=20
 WG_CONFIG=3D""
 INTERFACE=3D""
+SOCKET_NAMESPACE=3D""
 ADDRESSES=3D( )
 MTU=3D""
 DNS=3D( )
@@ -56,6 +57,7 @@ parse_options() {
 =09=09[[ $key =3D=3D "[Interface]" ]] && interface_section=3D1
 =09=09if [[ $interface_section -eq 1 ]]; then
 =09=09=09case "$key" in
+=09=09=09SocketNamespace) SOCKET_NAMESPACE=3D"$value"; continue ;;
 =09=09=09Address) ADDRESSES+=3D( ${value//,/ } ); continue ;;
 =09=09=09MTU) MTU=3D"$value"; continue ;;
 =09=09=09DNS) for v in ${value//,/ }; do
@@ -88,12 +90,14 @@ auto_su() {
=20
 add_if() {
 =09local ret
-=09if ! cmd ip link add dev "$INTERFACE" type wireguard; then
+=09trap 'cmd "${netns_exec[@]}" ip link delete dev "$INTERFACE"; exit' INT=
 TERM EXIT
+=09if ! cmd "${netns_exec[@]}" ip link add dev "$INTERFACE" type wireguard=
; then
 =09=09ret=3D$?
 =09=09[[ -e /sys/module/wireguard ]] || ! command -v "${WG_QUICK_USERSPACE=
_IMPLEMENTATION:-wireguard-go}" >/dev/null && exit $ret
 =09=09echo "[!] Missing WireGuard kernel module. Falling back to slow user=
space implementation." >&2
-=09=09cmd "${WG_QUICK_USERSPACE_IMPLEMENTATION:-wireguard-go}" "$INTERFACE=
"
+=09=09cmd "${netns_exec[@]}" "${WG_QUICK_USERSPACE_IMPLEMENTATION:-wiregua=
rd-go}" "$INTERFACE"
 =09fi
+=09[[ -z "$SOCKET_NAMESPACE" ]] || cmd "${netns_exec[@]}" ip link set "$IN=
TERFACE" netns $$
 }
=20
 del_if() {
@@ -256,6 +260,7 @@ save_config() {
 =09local old_umask new_config current_config address cmd
 =09[[ $(ip -all -brief address show dev "$INTERFACE") =3D~ ^$INTERFACE\ +\=
 [A-Z]+\ +(.+)$ ]] || true
 =09new_config=3D$'[Interface]\n'
+=09[[ -z "$SOCKET_NAMESPACE" ]] || new_config+=3D"SocketNamespace =3D $SOC=
KET_NAMESPACE"$'\n'
 =09for address in ${BASH_REMATCH[1]}; do
 =09=09new_config+=3D"Address =3D $address"$'\n'
 =09done
@@ -326,9 +331,13 @@ cmd_usage() {
=20
 cmd_up() {
 =09local i
+=09local netns_exec=3D()
+=09[[ -z "$SOCKET_NAMESPACE" ]] || netns_exec=3D(ip netns exec "$SOCKET_NA=
MESPACE")
+=09"${netns_exec[@]}" true || die "Network namespace '${SOCKET_NAMESPACE:-=
<unset>}' does not exist"
 =09[[ -z $(ip link show dev "$INTERFACE" 2>/dev/null) ]] || die "\`$INTERF=
ACE' already exists"
-=09trap 'del_if; exit' INT TERM EXIT
+=09[[ -z $("${netns_exec[@]}" ip link show dev "$INTERFACE" 2>/dev/null) ]=
] || die "\`$INTERFACE' already exists in network namespace '${SOCKET_NAMES=
PACE:-<unset>}'"
 =09add_if
+=09trap 'del_if; exit' INT TERM EXIT
 =09execute_hooks "${PRE_UP[@]}"
 =09set_config
 =09for i in "${ADDRESSES[@]}"; do
--=20
2.39.5


