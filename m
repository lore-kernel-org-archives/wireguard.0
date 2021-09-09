Return-Path: <SRS0=ZlE4=N7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C44C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Sep 2021 07:59:11 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51171610C8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Sep 2021 07:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51171610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6feb2a9;
	Thu, 9 Sep 2021 07:59:08 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4b3bd2d6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 9 Sep 2021 07:59:04 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id i28so1195764wrb.2
 for <wireguard@lists.zx2c4.com>; Thu, 09 Sep 2021 00:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=Gt+XRCUUjCWp+XeOBnG65TS/lZxkncqaiBvWN0ouwJc=;
 b=gRfQx/SJCoSjWD4Jed/kxKyeT74Qb16NeVz8oVVjjLSBbAh3fyMTefCPiILbC9FqZh
 Gnm8mT0scrBEaCmd1WAV2yiPXLf9zu0irucV3Ct6jLb2XVf/L0LGnuNO5mvBc4uNZkKZ
 Cd1w31VNmCUpZT39dT1m6YFhryl3Eo5afvyQqspNiJs+ydacK0DfwUiiUgJhOG9EHlJX
 k9i9bZc3c1SxhQS4b82KvfDpnHIaqGv4WiUORSq2JAqt0Fe4vTyTzzEUFJGqKBFmBTLD
 BxROqd/ieozYCcjg5VwaZ6eb+cdGa2AWSA8ldKbWDLZPTiGTOUOPL5MtR1oc5Etjm4Hw
 i+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Gt+XRCUUjCWp+XeOBnG65TS/lZxkncqaiBvWN0ouwJc=;
 b=eupNLc4g8oUmniah8S4fAvuxVyKKldb3soEIRgOMK+iUVEM96eAM+6C9i5Cy1664bI
 u2cWSwaem9gKuxagrSdzZAs7X23Uld5B0TA7XBbsjVHLCt8zHHWi6C8u6MfVw3Y3WGa5
 +UEL1OJYxVXzYNnSEnvV3764payHhATBBRhbr1a+YaOHdf7kdhL2qsyUolXGH0d92dvw
 UDUH6Ij0tvMKnyZ/7JI7n/67Q5Bzx12z3Cd7qzJRPyeHM6jXQI6YjeyFVa2nZGkwSjSw
 Wcw4YXqLdp2NNlAJa3xlQOwGAsQ3gjOnwotMEE6AH+yTlCHHiSroANTZZvNJ9dFNspl5
 Eedw==
X-Gm-Message-State: AOAM532Vw6PXZXddSKUY8Z3wZwyHI5QOeNFOmurKmjxiBZzXvjIlOz+I
 I+CpBCfAdZ7KDQi/je4nZVETyPntpms=
X-Google-Smtp-Source: ABdhPJzKS+60yxqx3KzKfxe+0ItaTIM1gdrHN1HQ40ep/nZZCA56da56fhlpM55l+NrmW+J+28qwYA==
X-Received: by 2002:adf:de8a:: with SMTP id w10mr1890211wrl.388.1631174343688; 
 Thu, 09 Sep 2021 00:59:03 -0700 (PDT)
Received: from [192.168.25.202] ([31.127.152.206])
 by smtp.gmail.com with ESMTPSA id y15sm926999wmi.18.2021.09.09.00.59.02
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 00:59:03 -0700 (PDT)
Subject: Issues with latest Windows build
To: wireguard@lists.zx2c4.com
References: <20210806044315.169657-1-someguy@effective-light.com>
 <OD24ZQ.IQOQXX8U0YST@effective-light.com>
 <CAHmME9oSo=4BtfO+=327n=gsor5gWcvhzAMS_BpqQ-6=6yxVRA@mail.gmail.com>
 <OD95ZQ.FW5WHNPSV04F@effective-light.com>
From: Peter Whisker <peter.whisker@gmail.com>
Message-ID: <5daec7ab-a97d-819e-56cd-c45176d355ee@gmail.com>
Date: Thu, 9 Sep 2021 08:59:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <OD95ZQ.FW5WHNPSV04F@effective-light.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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

Hi

I have a remote Windows system which listens for multiple inbound 
connections (and creates one outbound one) on a single tunnel. It worked 
fine with the new kernel driver but with the latest release 0.4.6 it has 
now stopped working.

Although it sees incoming packets (and shows the counts going up) it 
fails to respond to any inbound connections. If I switch kernel mode off 
it works fine in legacy Go mode so there is nothing wrong with the keys 
or routing.

Peter

