Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2A3C43219
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Apr 2022 23:48:48 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 57539351;
	Thu, 21 Apr 2022 23:48:48 +0000 (UTC)
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [2607:f8b0:4864:20::22c])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id a5e9caee
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 25 Mar 2022 23:11:59 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id e4so9801636oif.2
 for <wireguard@lists.zx2c4.com>; Fri, 25 Mar 2022 16:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=Im1zVujpYUT8wKNVuX7pbLmWiF/K1D8xAwctz7f9N2A=;
 b=pk65C5W3Vjp2m1luKGGKTea1b0I/jbX9XidbUMJM9m3bchhRbNjmH+Lyy7DcbT45c2
 dw2KWV2jDF2tgfkjLuVHNCEfnld2NUUdLjf8bLFH7o7P7FAhUVxTG7F/64lmq0hxlo+P
 9eqcYSrtQmj3/H75gDHzvJto18Cof/cU9Ui9rgGb4ZGk4gqz7uRPVgHv85eKMa95EclZ
 CX/a3AzjMmGpha7g0RC6g1/o6hMFj9eD+bs8EVirNvfu24dVSBQfwtg4XpmJqSpCIiC3
 6fArXuXBVuNpsifJqbrFkjxpR+ONdJGr3T0lw0SwBhzW40WRPuG4qJ1ZBrQls3q5SW+n
 nw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Im1zVujpYUT8wKNVuX7pbLmWiF/K1D8xAwctz7f9N2A=;
 b=ZUC/I4AudaBjWzeMmfJlm21hOugwpTKFkfxH9S7dwdmg5hG7FYgbmWVapFOmrsc82t
 zac2bOgm1Ez78AHNEadbHp5ffPOy8ObEix1+goI6AogEUoStUFPhSoJv6A39UQ8xyuv5
 Gpq8g0Ta/4G1/jkNX0RA734pZIqgmt3Yh4ET0dvglbQ9nL/lI1FUnc07sDOkHOKIcTct
 aFbLLZVCSQZAxL4JMsvktYfwGj2543GfVeO+WwuHCUfpv9pPi85K7VM9Xmo0Jjy9OBR5
 FUdPInQbqlH2T1f8mU54unUo8k4kwocBJzBSbnZyZihHdy2gkaQruy4+qpRuhlpcaU8x
 nRJA==
X-Gm-Message-State: AOAM530KtgyK6mYNoEc+EedKKmBY2n0HCAI1YNAcmz9yvasPsabGYwEu
 RzfrggpZQ1DSzVrOO5kBZwz1/1grmW3g60GLYu9ui+Lwg/0=
X-Google-Smtp-Source: ABdhPJycK4yuA0cz9cT3n5suBWxBTc+jziRQLat72waHl5IfuuNq9DxSZzWYtl8n3XGfmx7/Ul9C8JnZg15Ml2o+BPI=
X-Received: by 2002:a05:6808:14b:b0:2ec:b129:11c1 with SMTP id
 h11-20020a056808014b00b002ecb12911c1mr11612948oie.210.1648249918254; Fri, 25
 Mar 2022 16:11:58 -0700 (PDT)
MIME-Version: 1.0
From: Barry Cisna <brcisna@gmail.com>
Date: Fri, 25 Mar 2022 18:11:47 -0500
Message-ID: <CAL0AYvdc7Pm5b=MGXnQo3-yNmbBRQ8kF_oW75W8J0MGdh1J4VA@mail.gmail.com>
Subject: one subnet not pingable
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 21 Apr 2022 23:48:42 +0000
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

Hello All,

Peer2   (client) - Debian Bullseye
wwan0  = 100.64.2.161/30   # cellular modem CGNAT
bridge0 = ethernet & wifi interfaces   192.168.67.1
wg0client2  = 192.168.67.2

Peer 1 (server)
Google Cloud Instance Debian Bullseye static IPV4 address
ens4 = 10.128.0.2
wg0 +  192.168.69.1

PostUp = iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A
POSTROUTING -o ens4 -j MASQUERADE
PostDown = iptables -D FORWARD -i wg0 -j ACCEPT; iptables -t nat -D
POSTROUTING -o ens4 -j MASQUERADE

Peer2, Clients connected to LAN/bridge0 both wired and wireless can
webbrowse but is delayed. DNS not exactly right,,

Peer2 can ping Peer1 fine responds both interface addresses

If Peer1 pings Peer2 at 192.168.67.1 returns "no message,,,something"
and returns 192.168.69.1
if Peer1 pings Peer2 at wwan0 it gets a response
So..it seems the wwan0 can not hop to the bridge0 interface for some reason,
I have tried for hours to make static routes what i think may work,and
always get "route already exists'. tried a few iptables guesses on
client,,,no go..

Thanks
