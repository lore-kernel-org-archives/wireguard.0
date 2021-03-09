Return-Path: <SRS0=TBPu=IH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB4CC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Mar 2021 15:02:54 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83E62650C9
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Mar 2021 15:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83E62650C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wandera.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 738e7c28;
	Tue, 9 Mar 2021 15:02:51 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 35ab5b26
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 Mar 2021 15:02:45 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id l12so16232365wry.2
 for <wireguard@lists.zx2c4.com>; Tue, 09 Mar 2021 07:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wandera.com; s=google;
 h=from:mime-version:subject:message-id:date:to
 :content-transfer-encoding;
 bh=jjSmlnZcIpU5VPnApaeZ+PLBX5pWdcuyyhveojUF2qw=;
 b=eYHs1U6wxC+58dC3ZOPIPw72aR9ctvhIqDcaUtFv6m/BeLPhw5XCLW/cj/D/PWRufv
 Rsqmv/MOZIuZsIZAqcfjiTmtFxEryyQs0Qpq0FaElGBAnmNBxDVsuLFPcWqQ7KB+NGjT
 GuQTde4LmANPjTWvZJxDzyYU35mJDF1H7/SwnnkJ6wupubK9uAW78qEfHPSs/0p/bpng
 8niD5ezvHm48LieWnuas/mscyZXI/vCyCcnLRfKpJ3/+dQgAgK5FCH8Qf+J7WaD++Q8k
 mxxfhoKPNnumR5vXCSpqVG8W7q7t7T3//WxxpyZmi6tK5alj8edKtNfAY9ktUEwAypFP
 ofAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:message-id:date:to
 :content-transfer-encoding;
 bh=jjSmlnZcIpU5VPnApaeZ+PLBX5pWdcuyyhveojUF2qw=;
 b=FPZll6azxsmy4VkoKvmNz2Djt/6B3okzLS16q7PJuWmteKVgDanRFT0/WZ3epqkNpt
 QA9qzZx9Jq4cUDXkYtunODXS6XhbyNWC7y4NmQMM5Om4YEYP0r8OJbPXB/uqe/Y3tj4g
 4J4VEnkcEzsfZMBsc4gM7Au6bbS3TB0jwaKRb5HhxQ22srNq1xckd4cEOT9GtAJSSmeC
 Lgyf6EwzzZuXJfOD668q6b8cjhdfCjG9oonC/flfYWWeKtdSG2egrZ2TL2mloReEdogZ
 Ged1gramFdei6TvJ5x8dzzXIGicR5aCADykae/n9p/tdrBU+yy35jGBbjWlb+JRWK0wm
 GNFA==
X-Gm-Message-State: AOAM5329p+spymTf9VE1hYAUveeUk+NcwXvMORxa4vJERKYnIx2aOmPP
 PAz0LMF/pYfsov38DO7OYhHgkG6wpaeCiKBd/J5vaDDTAQObZ2r1r+r04oijIKdugrmRlyNam2F
 jEn+RZGALOKWWIv2O1ceipBvXhklBwgudPoG5JYQIMZRoHy7yhbPwklF0BK/56sGOwtPxpoWIsh
 k6sNCkAeg9
X-Google-Smtp-Source: ABdhPJx8IKhZ9b9+sjONeRnU6aytkUhd+yUK//+HYtxYMOLE3YJIjS97CxqGr5Cd9JF+pWi5cOxAFQ==
X-Received: by 2002:adf:a3d3:: with SMTP id m19mr29274744wrb.24.1615302163997; 
 Tue, 09 Mar 2021 07:02:43 -0800 (PST)
Received: from [10.255.240.33]
 (ec2-54-246-181-160.eu-west-1.compute.amazonaws.com. [54.246.181.160])
 by smtp.gmail.com with ESMTPSA id y205sm4976367wmc.18.2021.03.09.07.02.42
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Mar 2021 07:02:43 -0800 (PST)
From: Laura Zelenku <laura.zelenku@wandera.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: [PATCH] device: revert pipelining UAPI requests
Message-Id: <038632B3-A3F3-4FC6-8242-265A42F89F1F@wandera.com>
Date: Tue, 9 Mar 2021 16:02:41 +0100
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Content-Type: text/plain; charset="UTF-8"
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

Hello devs,
there is an issue when using wg-quick tool and wg tool bellow from wireguar=
d-tools repository (version v1.0.20210223). I=E2=80=99m running: wg-quick u=
p operation with config file in /etc/wireguard/ directory. Get operations a=
re ok. Processed without a problem. But for Set operation the processing wi=
ll stuck on "buffered.ReadString('\n=E2=80=99)=E2=80=9D (in the second run =
of for loop cycle, after set command is processed in first for loop cycle) =
because bufio.Scanner will read everything from the socket.
Please revert till proper fix is ready.

thanks
Laura

Signed-off-by: Laura Zelenku <laura.zelenku@wandera.com>
---
 device/uapi.go | 64 +++++++++++++++++++++-----------------------------
 1 file changed, 27 insertions(+), 37 deletions(-)

diff --git a/device/uapi.go b/device/uapi.go
index 659af0a..9fab911 100644
--- a/device/uapi.go
+++ b/device/uapi.go
@@ -414,44 +414,34 @@ func (device *Device) IpcHandle(socket net.Conn) {
                return bufio.NewReadWriter(reader, writer)
        }(socket)
=20
-       for {
-               op, err :=3D buffered.ReadString('\n')
-               if err !=3D nil {
-                       return
-               }
+       defer buffered.Flush()
=20
-               // handle operation
-               switch op {
-               case "set=3D1\n":
-                       err =3D device.IpcSetOperation(buffered.Reader)
-               case "get=3D1\n":
-                       var nextByte byte
-                       nextByte, err =3D buffered.ReadByte()
-                       if err !=3D nil {
-                               return
-                       }
-                       if nextByte !=3D '\n' {
-                               err =3D ipcErrorf(ipc.IpcErrorInvalid, "tra=
iling character in UAPI get: %q", nextByte)
-                               break
-                       }
-                       err =3D device.IpcGetOperation(buffered.Writer)
-               default:
-                       device.log.Errorf("invalid UAPI operation: %v", op)
-                       return
-               }
+       op, err :=3D buffered.ReadString('\n')
+       if err !=3D nil {
+               return
+       }
=20
-               // write status
-               var status *IPCError
-               if err !=3D nil && !errors.As(err, &status) {
-                       // shouldn't happen
-                       status =3D ipcErrorf(ipc.IpcErrorUnknown, "other UA=
PI error: %w", err)
-               }
-               if status !=3D nil {
-                       device.log.Errorf("%v", status)
-                       fmt.Fprintf(buffered, "errno=3D%d\n\n", status.Erro=
rCode())
-               } else {
-                       fmt.Fprintf(buffered, "errno=3D0\n\n")
-               }
-               buffered.Flush()
+       // handle operation
+       switch op {
+       case "set=3D1\n":
+               err =3D device.IpcSetOperation(buffered.Reader)
+       case "get=3D1\n":
+               err =3D device.IpcGetOperation(buffered.Writer)
+       default:
+               device.log.Errorf("invalid UAPI operation: %v", op)
+               return
+       }
+
+       // write status
+       var status *IPCError
+       if err !=3D nil && !errors.As(err, &status) {
+               // shouldn't happen
+               status =3D ipcErrorf(ipc.IpcErrorUnknown, "other UAPI error=
: %w", err)
+       }
+       if status !=3D nil {
+               device.log.Errorf("%v", status)
+               fmt.Fprintf(buffered, "errno=3D%d\n\n", status.ErrorCode())
+       } else {
+               fmt.Fprintf(buffered, "errno=3D0\n\n")
        }
 }
--=20
2.28.0





--=20
*IMPORTANT NOTICE*: This email, its attachments and any rights attaching=20
hereto are confidential and intended exclusively for the person to whom the=
=20
email is addressed. If you are not the intended recipient, do not read,=20
copy, disclose or use the contents in any way. Wandera accepts no liability=
=20
for any loss, damage or consequence resulting directly or indirectly from=
=20
the use of this email and attachments.
