Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA48C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 26 Jul 2022 13:12:10 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id f318858c;
	Tue, 26 Jul 2022 13:07:48 +0000 (UTC)
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [2607:f8b0:4864:20::229])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id d192951a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Jul 2022 15:38:15 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id o133so2383603oig.13
 for <wireguard@lists.zx2c4.com>; Thu, 21 Jul 2022 08:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=coder.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=Ep0CxlWQiIZ1sdigNkkh4brIBC1u83UAu8nnkcAAKM4=;
 b=b+eReDzlhyiaURDdUD95DCXB6cjEL6foIqMB3W0KY3iVjZh9q6Gu4X/Zafw8CvlEXA
 wI/ruI51jjJ38eWicbs9KLDz4WrvaMv2exleb+zcoGbb5KFL3py+0tAafhwgXxwHOkZT
 MMt8QWWyy2vaq0M8lWoQUhvXPYbNdBSDpTxX+Q5Hgorm6p30x32b4GgkAK4BgWQKouOZ
 NIKMdRdbqddQwfujrqLYzpgdtxJf68ugoHOO09AOzOCE77+2qP7U4jPVcVcdhCofXppQ
 MUCp7yUcFPU8qF0mrDtnhdjO2juiRQSQ+Gc58Yri0JjJyHYeoAeD7sllllsFy+syUqX4
 pBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Ep0CxlWQiIZ1sdigNkkh4brIBC1u83UAu8nnkcAAKM4=;
 b=y/a66WEVWEEUeSlOQt/oXb1gE93xlcPkdsaVIaWU7BpGqt4afIGPSa/i70PMdavecI
 RsaidQPjmYDlStZWtH64A1HmiA/FBWfd4trbeDvPOFbSnuMSiI2Oz6KnEoyBGc1urfVF
 cXEbH2SUt1Kgt7K4H7JAwYBAk1QCyV3f0S73d4ioX/Db/9GD80QCb11FminzTh+/48Q+
 JkwJ7LUHamU8JwuZGMhfDZob0oHwiOMzWYKrTT/6+ldn8GvFnjhZo91c2ve0VZ4do5uF
 olwlDTC2JxzjJGsQuYh1vZ0AWlOG1SQsDDvfEJB5CPSEbEtr4Hg/gyPGoOs6K+Z94v8h
 gV/w==
X-Gm-Message-State: AJIora+KK2LR2oJF11P/VA3Xa0xdQncxl2zNr6jUJ24WatPieZNlu107
 U1Clu2ZaZnHeMdwoix+YtZ70c9tYiJy8DDOg915NOqwrn+2cQfgl
X-Google-Smtp-Source: AGRyM1uF1t54kA7uS5i1j70MFOoGL2HDFz2nkiO++CpsxUN6hYr6C1CF2CSVIfW99tATslgkLMxj81PnK1mCRxo6UuQ=
X-Received: by 2002:a05:6808:238d:b0:33a:7c9b:a1c7 with SMTP id
 bp13-20020a056808238d00b0033a7c9ba1c7mr4963751oib.7.1658417894040; Thu, 21
 Jul 2022 08:38:14 -0700 (PDT)
MIME-Version: 1.0
From: Spike Curtis <spike@coder.com>
Date: Thu, 21 Jul 2022 08:38:03 -0700
Message-ID: <CAAi99JAdRNepDqE-+P1g7TnBmPa5AU8DBdTXbee8ZbGxZ70deQ@mail.gmail.com>
Subject: wireguard-go - peer goroutines can SIGSEGV on device.Close()
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 26 Jul 2022 13:07:47 +0000
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

I have encountered what I think is a bug in wireguard-go which causes
a SIGSEGV like:

panic: runtime error: invalid memory address or nil pointer dereference
[signal SIGSEGV: segmentation violation code=0x2 addr=0x20 pc=0x1006ce478]

goroutine 150 [running]:
golang.zx2c4.com/wireguard/tun/netstack.(*netTun).Write(0x140004501e0,
{0x14000192000, 0x58, 0x100000000000000?}, 0x3?)
/Users/spike/go/pkg/mod/github.com/coder/wireguard-go/tun/netstack@v0.0.0-20220614153727-d82b4ba8619f/tun.go:192
+0x108
golang.zx2c4.com/wireguard/device.(*Peer).RoutineSequentialReceiver(0x14000558000)
/Users/spike/go/pkg/mod/golang.zx2c4.com/wireguard@v0.0.0-20220703234212-c31a7b1ab478/device/receive.go:476
+0x4a0
created by golang.zx2c4.com/wireguard/device.(*Peer).Start
/Users/spike/go/pkg/mod/golang.zx2c4.com/wireguard@v0.0.0-20220703234212-c31a7b1ab478/device/peer.go:199
+0x2c8


I believe this happens when I call `Close()` on the Device with this
Peer.  Closing the device triggers gVisor to Attach a nil
NetworkDispatcher to the tun, which the Peer goroutine attempts to
dereference via Write.  This is a race condition that depends on
whether any packets are queued up at the time: if the queues are
empty, we are fine.

I'm able to work around this issue by calling RemoveAllPeers() prior
to Close() on the device, but presumably it wasn't the intention to
make Close() on its own dangerous in this way.

I'm happy to offer a patch if you're interested.

-- 
Spike Curtis
Principal Engineer
coder.com
