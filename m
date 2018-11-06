Return-Path: <SRS0=8Q1O=NR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5973BC46464
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Nov 2018 19:45:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0279520830
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Nov 2018 19:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0279520830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 847584a7;
	Tue, 6 Nov 2018 19:40:51 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 996d68bd
 for <wireguard@lists.zx2c4.com>; Tue, 6 Nov 2018 08:38:04 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1088ad1d
 for <wireguard@lists.zx2c4.com>; Tue, 6 Nov 2018 08:38:03 +0000 (UTC)
Received: from [192.168.0.9] ([82.28.192.155]) by mail.gmx.com (mrgmx001
 [212.227.17.184]) with ESMTPSA (Nemesis) id 0MN1j6-1gQXa82dlg-006ePn for
 <wireguard@lists.zx2c4.com>; Tue, 06 Nov 2018 09:42:20 +0100
Received: from [192.168.0.9] ([82.28.192.155]) by mail.gmx.com (mrgmx001
 [212.227.17.184]) with ESMTPSA (Nemesis) id 0MN1j6-1gQXa82dlg-006ePn for
 <wireguard@lists.zx2c4.com>; Tue, 06 Nov 2018 09:42:20 +0100
From: GMX John Thomson <john.thomson81@gmx.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: Channel/Tunnel bonding with wireguard
Message-Id: <2459F6D1-D3CA-440D-801B-7B2B979995BF@gmx.com>
Date: Tue, 6 Nov 2018 08:42:19 +0000
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3445.9.1)
X-Provags-ID: V03:K1:RWwnmNZfovhE6x24B7BF1/a+ixUrEDX2hzk1HlhPPyLAT5Euxzk
 LZew6qiVvLM2xcxPagoj06wCu8kn2a8mXb3J5NAkN9RHkx8vJ76N0cehcdXa4afwIQ3e4Ha
 Xr7brhY1XZhnBcHcnIRaAuf9BfkNo7J+2n4n8mB0OVyt9RcMl1w1ZjYsYfryjS4MgADlVsG
 AUPB9IDBAD1qZPqRvz42w==
X-UI-Out-Filterresults: notjunk:1;V01:K0:nTW1zwGAOx4=:9HKTAhFAFn2OCUXxaalWPn
 7diQNGus/KPl1s9HO65wAZ0zfuscZ/ydWn267dK0m2EtUJAp3D+JGh3RkfpVGiy5CL8G6LGwN
 gAl9zK7Eb1idDeZ7C1oKyBKgx4jn08Pc4c8eBBxmK4Sm8cJDmWmXt/g6pe6EXov7y5lhNU3vW
 V5LFJSh0V1rJJIi/Lh8RScHy5Dh7UXsuOA1M9tmbG3O+RhN3HBsTXySI/3QsnWECcjh+64qLx
 lKLkcZQ08ekAwtykiCBL/Eaiuw5yPzzyKdK4ox0/etrYuyK3dw2PZia2tPPjje7ChH6OeQFLj
 2wrXr1Jig0RYIIYaEynUTy7QhNhhJcGWxFSise4rhPdqwqxiMsCAYfSlt5wmCfXghSP4Cn9bT
 ECsrvd3j6ayC+SGedzfCs6fFpWpKocTk0vTDIZvWZ3LGp7oK3R668ehRS2W+3vCs2CzdQ9XrT
 GGnnkLDOzwaflW8So3fc1Z2z8BrXxiIfQZlu7/v8x8hLBNvKEupwIFKliDcLyVL4Tk5c7iH8g
 x+/1PdeW4rPWoaSdWPBUNDrRsKxyV+BZDHrZcNq37oDVu9NeYx7A3Cj6bWMHvEHnKVbg+HYwT
 wRKNkcSdPT+K/LzHtkNx6PhzRpIWFMg2PNW2hR1c9SEiWyu7cYgdXN0dgSByfWujNfejUz625
 MU9K6knxejvqD6Wz0JmN7dJiWUX7xQ2j7GFot6oBZIWrNAO/1287nWgdHNGEV2rTNxJXeQZyj
 5ihgIhdLMOtxOV26BtTzGjEFlFHdYCMVrGatU8Z2lGFVyvlzMB1p2CA9+sN1XDhVw4gT3W8Ie
 4JXi2EPRQ7IVtomU/1AQdTraBAmljJUxhFqyMFV6cZEPJ7NWSbFBTL5lYZQkf/Aav3UvVUbDH
 vtCNUHX6/tG/Du6SO3vc07EdgQMpbyuPAqtwf2PISYK44UHnJoeN07DPHT/1WYiUMtmbVCg63
 dytJAMiHlYQ==
X-Mailman-Approved-At: Tue, 06 Nov 2018 20:40:49 +0100
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi Saeid,

Did you manage to get any further with this idea, cause I was planning on doing something similar

Thanks,
John
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
