Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0CDC433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  5 Nov 2022 00:38:47 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7f7e1381;
	Sat, 5 Nov 2022 00:36:34 +0000 (UTC)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id be789e81
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 5 Nov 2022 00:30:37 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id k19so8572597lji.2
 for <wireguard@lists.zx2c4.com>; Fri, 04 Nov 2022 17:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=n5mP83tGa0Ci+2P+og9mzcPmowlTb/Vw4y0KUNGGi0c=;
 b=mMIxlJw6wpflWv0RMTtvq3FaRPy8HVVP/4sbiAeiPmgimGxbLIgataAj6pFeWTqZmg
 +p0HUBefO3VDPZtr1PBDF6Kn6QcX7VIujdKT1NsKwquKXnw67/jELUyqSq4MA4p/DaIR
 YXo2h9Rn+mK317FSw0rb8b5E75qyt5KhMh/WnKOoWMAtC0dYgf5MY3udEamtqLhliMQb
 bZAKDAxsDl5NsdT41MOvMq83IBF13zBWYm733LOkoo9COkhopEs9S3XcGnY6WPxa6Y12
 9lW+sLFdMFqoim5ugJx833t/ivQFPOLRU+9IOREJGnnMevk8TG7bKp+m0ZklY0BlKjiD
 qmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n5mP83tGa0Ci+2P+og9mzcPmowlTb/Vw4y0KUNGGi0c=;
 b=uFN0N9jJM33bg7Yt4z0q2UNqMw8M5RDXKfhKrQzklieDRbbMxEXjcPioBjnmFRKq5k
 7LimrxM53fgjRwDh87XeAviP3NMgWfd1FJo5siFoCIy5gm44tt9O2SEuHVCG8HQE+Sg8
 T8hRUuUABD5wfPNeBHWLZBl69sU94oEdEveRiZsnHPQ3n15R8JtcAFg3Hz5aHiAd5VHB
 Dg71BXTIL/wXsDV65fy7y1TqcW+XuLaylXyFj204cRb6f+N4wGL2/MWwAPG24XbR3nNR
 C9go3dr8I98QL436HgE5errIzTcxhmmQRFwstaQzbzVVj/2wj75l/rzSIiWHPDmyO5wa
 rupw==
X-Gm-Message-State: ACrzQf34LNpKLEYUDhUajs0AfT929aQogYxDCnEAUeNb/xL5E4U4/K8+
 NCeleO2N82ROMstkXtkQg0aJ23Zq/JWyvq74dPtqywt2FxxQ
X-Google-Smtp-Source: AMsMyM7qvpIzkv2WUlc39y+EjK2mAHl8fKz5NvEHn/8uXFUjOH2gstJASEXhXgUNPbN7ptppR+m6DCJFdeVqTL8axNQ=
X-Received: by 2002:a05:651c:1073:b0:277:35ca:5eef with SMTP id
 y19-20020a05651c107300b0027735ca5eefmr14091294ljm.150.1667608236404; Fri, 04
 Nov 2022 17:30:36 -0700 (PDT)
MIME-Version: 1.0
From: Clark Case <clarkcase@gmail.com>
Date: Fri, 4 Nov 2022 20:30:25 -0400
Message-ID: <CAHDWkzZG9MhJ3qe7Q_BYrcYnynBec=VDFG-_T7qp2Fdc6GS42A@mail.gmail.com>
Subject: Windows Client Can't Set MTU Below 1280
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 05 Nov 2022 00:36:33 +0000
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

Hi All - I'm trying to set up a WireGuard tunnel via udp2raw. The
client side is running Windows, the server is the linuxserver docker
container

I can get the tunnel set up through udp2raw, I can ping across it, I
can use mosh across it, I can sometimes do ssh, but I can't get HTTP
either with a browser or with curl. Based on some input on reddit, I'm
trying to lower the MTU of the virtual adapter. However, the lower
limit that seems to be permitted by the client seems to be 1280 - and
1280 doesn't fix the problem. Below 1280, I get an error when trying
to activate the tunnel.

I'm assuming that this is because of some code in here:
https://github.com/WireGuard/wireguard-windows/blob/master/tunnel/mtumonitor.go

var minMTU uint32
if family == windows.AF_INET {
minMTU = 576
} else if family == windows.AF_INET6 {
minMTU = 1280
}
I'm not trying to do anything via IPV6, and I don't have an IPV6
address specified on the server side or the client side config files.
I've tried disabling IPV6 in the physical adapter the virtual adapter
is binding to, but I still get the error.

So, is there something else I should be doing to convince WireGuard
that I just want to do IPV4?
