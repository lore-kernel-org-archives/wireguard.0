Return-Path: <SRS0=erT1=NE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA196C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Aug 2021 22:13:54 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAABB6103A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Aug 2021 22:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EAABB6103A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e886f8ee;
	Fri, 13 Aug 2021 22:13:52 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2ae00727
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Aug 2021 22:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1628892165;
 bh=Grx3Y53rXHhvvenYOhKLqezNKejlduSlwSKxlolKMG4=;
 h=X-UI-Sender-Class:To:From:Subject:Date;
 b=b5/KayVh7SMHTV5e8M0684YRzOO0c02kTBN4O4hzgNdsXDGCsD3fC7IJzeS1RMN8Z
 RkkWvPPKMLk46Lo7vYne+hz2vjyra5+MlQbavIwfHDlwgcCLl8TGFv0qefCF32GnNt
 4tG70vJPyxFsQ0J4x0yapPJGxjs3a9a++q/le/x4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.2.105] ([93.216.126.251]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mrft2-1mr0IS3QtI-00o1aG for
 <wireguard@lists.zx2c4.com>; Sat, 14 Aug 2021 00:02:44 +0200
To: wireguard@lists.zx2c4.com
From: =?UTF-8?Q?Lukas_L=c3=bcdke?= <lukasluedke@web.de>
Subject: Problem using "WireGuardSetConfiguration" for Wireguard-NT with heap
 allocated configuration
Message-ID: <e3f36b3e-5337-0d04-6c8a-9ce1bb6c234e@web.de>
Date: Sat, 14 Aug 2021 00:02:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:++rsSPzVKXE7EdtgkK44wTa72MTQIF/8aa7qlCSvLs2jWUDhflT
 RZBta+oZwYmgKMflWeSWZX8AGUWD9ZzCsJFdPYmE46YlYpYcTKrPhT7c7J+fFf26oOKEHhO
 rhT+GlbJh9ukMIKJzNvytQOTxOIkYVeIF1RTq8tzXl3wfyEHkmTqCT1eCkTRFIqSKNhRVW4
 oLP0H0q75t1kzA2cy7haw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LE6epXxDmpg=:3dTPahNm0KrShEGClb4Vww
 89e0fj4hWKrCxhIz6kbzcFl55nd+B3CZg6ybqlctDqaYAQFS8EZGgH1MIRnfNd7WkI/U0GCwl
 o3Wim2zeSZ+Xu7/zwyj6e84dBcMNlsnDenpvG3vDFjRS2OanH6YVnXcgEVvM5ZvGPGjYAd0fZ
 tYoQQgIy5XkdVWVmPbpd0l4kLmgEzynxr7PQM8Ci9e7TrT2jIUQU4XGBu+iX9lcd1Bm3DaeJW
 kI1gQ71rvH46f3Kwc6Is5ecuX8TdKYX3Ssq0WnP1TJCAMg8wG9Ny+NgLR0l/5BkchpdXllgge
 4tZWrfZIqXsihG2RI6l824elfcncAB++/nrTb1+wYVzuRZqqBJ0BnOSvQ9ogPAnr8fEXf+jc7
 M1sEMe1gI2iro9ia9u2XYnjEGtuepIFNXBUCVf58cWlXOA8RfN+CEwis6lxlhPGpd3YaO+qgH
 6gQWsFgQnBmxvfsMpW/kkIz/tKM3EUEDfmbZV+SU8J0GPeYe1xyixM/xrqc0pSplhenimcWIx
 iURhezOibJPMZijOVsWd1ovrctv86E2imrqFvMI0E91vtdLqtBreqeyNThZVAcnoIdsaXdq9a
 S7KdKb/PKeEHdARFEAYz387Kz5AfCoylDPSc4J29UV0ll5aUkn1C9H/rpgxTMuZ+I72whFEmn
 9MSWeYlx6BnrQPvPv+zepQ+KT5HW274bSs2DhJM6fILGktetL81ziAre72OIveJuNOn4vJC2G
 y4HfVb2oEYXvHqhvHr/0ZsSErCPB1aL5sCtkib2x2fm1DcGfnW0N4K3192uuLx5XGT25RMtH/
 PvbjN1wdgmMdegHFnvbe0TuaNrHheFGM52rDs6ENHbEaws3QAvtwhTZNBHaoqeNmumGvkkfNH
 ZkxAAs2l093Qi2y/12Rl6Ibugf82U9IVPBUbH0WAAVoco5WboqYhzpEbOyVOs9hXNYOSVGO5+
 NPtcCXIkovMWFs1UbYM4NFlPtY5BV6GMAXawH69z5SBEbBtZLWdOFbk+OxXj5yM6vjFQNlhd9
 1c19ZIUMDH14rMqdE5xR+qDwNqR6oROg0ke+Nxg6qqiJrDUmexhg4Fz3EbtIt7JFH3Au4XL53
 CmMjVPf21jTTTGsBkIPB5NGk6m3SWhxh5zot3hiiDuOKdXhajKAI6+mnQ==
X-Mailman-Approved-At: Fri, 13 Aug 2021 22:13:51 +0000
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

Hello,

I am trying to implement a custom wireguard client using the provided
wireguard.dll/wireguard.h in c++.
I tried to modify the example from here:
https://git.zx2c4.com/wireguard-nt/tree/example/example.c
It works, when I specify a struct with one interface
(WIREGUARD_INTERFACE) and one or more peers + allowed ips
(WIREGUARD_PEER, WIREGUARD_ALLOWED_IP) and then use
"WireGuardSetConfiguration" to the the configuration on the adapter,
like it the example.
But when I try to use a buffer allocated on the heap, containing the
interface and the peers + allowed_ips, I always get error 0x57 from
"WireGuardSetConfiguration".
It seems to work, when I only create the buffer and memcpy a
WIREGUARD_INTERFACE object into the buffer, but if I create a larger
buffer and also memcpy the WIREGUARD_PEER object into it, set the Flags
and set the PeersCount, I get the error.
like in the following example it does not work:

unsigned char* buffer =3D (unsigned char
*)malloc(sizeof(WIREGUARD_INTERFACE) + sizeof(WIREGUARD_PEER));
/*new_interface is the interface from the example.c file*/
new_interface.PeersCount =3D 1;
memcpy(buffer, &new_interface, sizeof(WIREGUARD_INTERFACE));
unsigned char* buffer2 =3D (buffer + sizeof(WIREGUARD_INTERFACE));
/*peer is a created peer, which does work, if I use it in a struct*/
memcpy(buffer2, &peer, sizeof(WIREGUARD_PEER));
if (!WireGuardSetConfiguration(Adapter, (WIREGUARD_INTERFACE
*)&(buffer), sizeof(struct t))) {
 =C2=A0=C2=A0=C2=A0 LastError =3D LogError(L"Failed to set configuration",=
 GetLastError());
 =C2=A0=C2=A0=C2=A0 return cleanupAdapter(Adapter, WireGuard, LastError);
}

Does anyone has an idea, how I can implement this correctly, so that I
can dynamically add/remove the peers and I am not forced to create a
struct with fixed peer count?

Best Regards,
Lukas
