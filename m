Return-Path: <SRS0=3Rrq=4D=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A578DC352A3
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Feb 2020 22:42:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9E602086A
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Feb 2020 22:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9E602086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lists.m7n.se
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a3f859db;
	Sat, 15 Feb 2020 22:40:35 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2cdf07ef
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Feb 2020 22:40:32 +0000 (UTC)
Received: from bond.m7n.se (bond.m7n.se [IPv6:2a00:1a28:1251:46:246:28:121:1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f0afeabb
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Feb 2020 22:40:31 +0000 (UTC)
Received: from [IPv6:2001:470:de6f:1310:4148:f67c:be44:b67d] (unknown
 [IPv6:2001:470:de6f:1310:4148:f67c:be44:b67d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by bond.m7n.se (Postfix) with ESMTPSA id 6B6DE600A1D7
 for <wireguard@lists.zx2c4.com>; Sat, 15 Feb 2020 22:42:46 +0000 (UTC)
To: wireguard@lists.zx2c4.com
From: mikma.wg@lists.m7n.se
Subject: wireguard-go: IpcGetOperation: return peers in sorted order
Message-ID: <cdf774f4-694e-22ab-966a-c57a1b9ff10a@m7n.se>
Date: Sat, 15 Feb 2020 23:42:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------8BB2EE54CC7A304E3607E9A1"
Content-Language: en-US
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
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

This is a multi-part message in MIME format.
--------------8BB2EE54CC7A304E3607E9A1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I have an improvement to IpcGetOperation in wireguard-go.

uapi: IpcGetOperation: return peers in sorted order

Sort peers based on the public key.
The pros of using a sorted peer list is that the order doesn't change in
each ipc operation, or execution of the "wg showconf" command. Which 
could be the case previously with an unsorted peer list.

The output from git format-patch is attached. The patch is also 
available at 
https://cgit.m7n.se/pub/wireguard-go/commit/?id=027bf58651f1a7b2be1bedfde187e5277a13f48e

/Mikael

--------------8BB2EE54CC7A304E3607E9A1
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-uapi-IpcGetOperation-return-peers-in-sorted-order.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-uapi-IpcGetOperation-return-peers-in-sorted-order.patch"

From 027bf58651f1a7b2be1bedfde187e5277a13f48e Mon Sep 17 00:00:00 2001
From: Mikael Magnusson <mikma@users.sourceforge.net>
Date: Sun, 22 Sep 2019 23:13:30 +0200
Subject: [PATCH] uapi: IpcGetOperation: return peers in sorted order

Sort peers based on the public key.
The pros of using a sorted peer list is that the order doesn't change in
each ipc operation, or execution of the "wg showconf" command. Which could
be the case previously with an unsorted peer list.

Signed-off-by: Mikael Magnusson <mikma@users.sourceforge.net>
---
 device/uapi.go | 41 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/device/uapi.go b/device/uapi.go
index 72611ab..bd66451 100644
--- a/device/uapi.go
+++ b/device/uapi.go
@@ -7,9 +7,11 @@ package device
 
 import (
 	"bufio"
+	"bytes"
 	"fmt"
 	"io"
 	"net"
+	"sort"
 	"strconv"
 	"strings"
 	"sync/atomic"
@@ -30,6 +32,42 @@ func (s IPCError) ErrorCode() int64 {
 	return s.int64
 }
 
+type PeerInfo struct {
+	pubkey NoisePublicKey
+	pubkeySlice []byte
+	peer *Peer
+}
+
+type PeerInfoList []PeerInfo
+
+func (list PeerInfoList) Len() int {
+	return len(list)
+}
+
+func (list PeerInfoList) Less(i, j int) bool {
+	k1 := list[i].pubkeySlice
+	k2 := list[j].pubkeySlice
+
+	return bytes.Compare(k1, k2) == -1;
+}
+
+func (list PeerInfoList) Swap(i, j int) {
+	list[i], list[j] = list[j], list[i]
+}
+
+func (device *Device) GetSortedPeers() PeerInfoList {
+	peers := make(PeerInfoList, 0, len(device.peers.keyMap))
+	for pubkey, peer := range device.peers.keyMap {
+		info := PeerInfo{}
+		info.pubkey = pubkey
+		info.pubkeySlice = info.pubkey[:]
+		info.peer = peer
+		peers = append(peers, info)
+	}
+	sort.Sort(peers)
+	return peers
+}
+
 func (device *Device) IpcGetOperation(socket *bufio.Writer) *IPCError {
 	lines := make([]string, 0, 100)
 	send := func(line string) {
@@ -65,7 +103,8 @@ func (device *Device) IpcGetOperation(socket *bufio.Writer) *IPCError {
 
 		// serialize each peer state
 
-		for _, peer := range device.peers.keyMap {
+		for _, peerInfo := range device.GetSortedPeers() {
+			peer := peerInfo.peer
 			peer.RLock()
 			defer peer.RUnlock()
 
-- 
2.17.1


--------------8BB2EE54CC7A304E3607E9A1
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--------------8BB2EE54CC7A304E3607E9A1--
