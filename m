Return-Path: <SRS0=x3Nk=MT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 920B5C64EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 01:13:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3077206B2
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 01:13:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQuXFDxJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3077206B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dd5dc2e9;
	Sun, 7 Oct 2018 01:12:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84c4d764
 for <wireguard@lists.zx2c4.com>; Sat, 6 Oct 2018 10:58:35 +0000 (UTC)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 052ba790
 for <wireguard@lists.zx2c4.com>; Sat, 6 Oct 2018 10:58:35 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id v133-v6so5838611pgb.2
 for <wireguard@lists.zx2c4.com>; Sat, 06 Oct 2018 03:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=cBYVxIHbZBZqH1IImBrSLFPHHJ6aP7DmfK35QXSu8OE=;
 b=dQuXFDxJd4RPPJAtdPrbGO0U16uDCB4bXFSNPcGbRcrQVRQzI0CmAiErwHEBMrGjXL
 GrOlpK0En0qNUWIz9WaUoEf5uFFPrlNzKnBXH0dRj7SeCbe+zcz52T5/ADESL3qQy0qO
 SopYcZzMds8O3XfFZO5BBJSkgymKtmFvtAooMnL/qBR0NpAWhVYdzqDkJByLaTOr90rv
 YuLvQxbp4j2Tokg5Rsuh4nFmCnqoRS9SLytiac5evBMh7B8CC4V5+4gdpZ78guh234CI
 PfVsq3yYqqxSPjCKME4NeKdY1cZdYgqXrwkFXATaCIfNGVS6zxW8LDPKWh+k7zXqIR0a
 bnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=cBYVxIHbZBZqH1IImBrSLFPHHJ6aP7DmfK35QXSu8OE=;
 b=VdF2Bqb67NuxeQo5BDW5cIcOedVW6OuDuqQ8L4Z7NPgzk1kzL8e07dkKwQX6JXtBDY
 08+qtySU/pYXX2vxh1+Q0gJAkAof/8KKTcjtanknChPYcDObED4Ql4Oo+NmStxLMoXDN
 YVCYPs5ILh9JPDZTbS8aiktebKEX4OjpsNEHtd2P+aC8ZPc6vtYJSYT0BsDTH/Oe2N7F
 /jVrAgj9qhzgs7VFdZ/QbBzAIWCVwSyl17BXE/vqzlC6RVKhL2nnvToDzd0Dob/LaWo8
 M7LZP2i58CvaY8hb0FymcDtvXEJOwK73LXiyZE1iOftvbcy94muKvk6wshvwTuSHLD2c
 xvtQ==
X-Gm-Message-State: ABuFfog9cHXe9L/TNPVZURpcjrEhY6l/m3S8WW2SjJKWQdKQyrvnY3eU
 6mF0MviKvzPC3e0ROADFqU85ega+abQ=
X-Google-Smtp-Source: ACcGV62Ve2iM2JXi/cFDzLQS1nptCzPCUoVpKkI4uO+/LqY7IrDHU1UGezyZtsCqOV8Pb5prBwLDZw==
X-Received: by 2002:a62:ea03:: with SMTP id
 t3-v6mr16678658pfh.228.1538823545347; 
 Sat, 06 Oct 2018 03:59:05 -0700 (PDT)
Received: from [192.168.1.113] (c-24-17-48-247.hsd1.wa.comcast.net.
 [24.17.48.247])
 by smtp.gmail.com with ESMTPSA id y19-v6sm22484942pff.14.2018.10.06.03.59.03
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 06 Oct 2018 03:59:04 -0700 (PDT)
To: wireguard@lists.zx2c4.com
From: Jason Edson <jaysonedson@gmail.com>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20181006` Available
Message-ID: <7739c357-0957-8382-a6e2-9c00c760fab4@gmail.com>
Date: Sat, 6 Oct 2018 03:59:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Sun, 07 Oct 2018 03:12:52 +0200
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

I started getting build errors today with the latest release. I'm 
building Wireguard in a 3.18.123 kernel using Clang 8.0. Here is the 
error, any help would be appreciated.


net/built-in.o: In function `selftest_run':
/media/otherhd/android/out/target/product/marlin/obj/KERNEL_OBJ/../../../../../../kernel/google/marlin/net/wireguard/crypto/zinc/chacha20/../selftest/run.h:20: 
undefined reference to `__compiletime_assert_21'
/media/otherhd/android/out/target/product/marlin/obj/KERNEL_OBJ/../../../../../../kernel/google/marlin/net/wireguard/crypto/zinc/chacha20/../selftest/run.h:20:(.init.text+0x4874): 
relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol 
`__compiletime_assert_21'
net/built-in.o: In function `selftest_run':
/media/otherhd/android/out/target/product/marlin/obj/KERNEL_OBJ/../../../../../../kernel/google/marlin/net/wireguard/crypto/zinc/poly1305/../selftest/run.h:20: 
undefined reference to `__compiletime_assert_21'
/media/otherhd/android/out/target/product/marlin/obj/KERNEL_OBJ/../../../../../../kernel/google/marlin/net/wireguard/crypto/zinc/poly1305/../selftest/run.h:20:(.init.text+0x48a0): 
relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol 
`__compiletime_assert_21'
net/built-in.o: In function `selftest_run':
/media/otherhd/android/out/target/product/marlin/obj/KERNEL_OBJ/../../../../../../kernel/google/marlin/net/wireguard/crypto/zinc/selftest/run.h:20: 
undefined reference to `__compiletime_assert_21'
/media/otherhd/android/out/target/product/marlin/obj/KERNEL_OBJ/../../../../../../kernel/google/marlin/net/wireguard/crypto/zinc/selftest/run.h:20:(.init.text+0x48b8): 
relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol 
`__compiletime_assert_21'
net/built-in.o: In function `selftest_run':
/media/otherhd/android/out/target/product/marlin/obj/KERNEL_OBJ/../../../../../../kernel/google/marlin/net/wireguard/crypto/zinc/blake2s/../selftest/run.h:20: 
undefined reference to `__compiletime_assert_21'
/media/otherhd/android/out/target/product/marlin/obj/KERNEL_OBJ/../../../../../../kernel/google/marlin/net/wireguard/crypto/zinc/blake2s/../selftest/run.h:20:(.init.text+0x48d0): 
relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol 
`__compiletime_assert_21'
net/built-in.o: In function `selftest_run':
/media/otherhd/android/out/target/product/marlin/obj/KERNEL_OBJ/../../../../../../kernel/google/marlin/net/wireguard/crypto/zinc/curve25519/../selftest/run.h:20: 
undefined reference to `__compiletime_assert_21'
/media/otherhd/android/out/target/product/marlin/obj/KERNEL_OBJ/../../../../../../kernel/google/marlin/net/wireguard/crypto/zinc/curve25519/../selftest/run.h:20:(.init.text+0x48e8): 
relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol 
`__compiletime_assert_21'

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
