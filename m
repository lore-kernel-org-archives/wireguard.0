Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9696CD128A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Apr 2024 18:22:11 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 66888d66;
	Wed, 3 Apr 2024 18:22:10 +0000 (UTC)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3e6fdf91
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 3 Apr 2024 18:22:07 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1e29328289eso949615ad.0
 for <wireguard@lists.zx2c4.com>; Wed, 03 Apr 2024 11:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1712168526; x=1712773326;
 darn=lists.zx2c4.com; 
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=b+6ScChiC8zS3o9tbiOgcc1DiBxz6xvmMgS5MbEqCVk=;
 b=2+nhdpgifNnjOHgUGM7aAjqip3b2tatP8wdTZihQlLAbu9nxY4J1gLV53FryaSp98N
 ig8P/xBaZ+7RSFj6rSp6Qp2cb34NgYaDOX1qZn8+7EVJOq2s6Oj1+MNbE9Q8jQUw0Lii
 8pCJpqY/N3xyqefSbQB5t22QtpiBlSQc9bP9/IeoKRbvQ8wIlKKaek/c0V/8YG9cl/AB
 AM41OVTvZtEqQ/l8727utxjW4SoHeg8sK3saymlkbK334rP0GK2QaP074b7iXqBrpp0f
 OkcHrgHZMIr8mMPc0eN0JvYuAispMBlJLPlAyEtzoUSVqOmYAe2HpuJC078lQDSk2pQI
 lSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712168526; x=1712773326;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b+6ScChiC8zS3o9tbiOgcc1DiBxz6xvmMgS5MbEqCVk=;
 b=X4IuVCXqLTsf8Fux1ggoPf5IE88GlRVZ7d+Pgc/YUO0VAHMYkhhJP/5UN9MXDwc216
 4VldlHhHzk+rle1kpYv7ctnXUI1YFivUmYfWKP1rpHBrZBQlV3QAFCxE31xs+Oh4ep+D
 VHMF/jBUBtqTPWZP8GogDHXViZJmcxAFgKTzfbEG4mQGIqPpZXLmpNnLYO9UIYYW5SNy
 JgYyyI6viLi+zlH9uhEeP8bfGx1I1wslJjDSgqeYwkFMmSe52K1Ub+FnfL0DGQjmARrZ
 iWVs3UyfRl1831y5hqVZ5LWfcJaz8PgV/OOSfgh7uKWT+oPTW25NKIYTMzxo3Xx695v8
 A44g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTXptMi5oKwfYU4QL9xF1Qmi1ZTfw8IfeUhI3cY07atdmyXSK6hUOYH2gU8CRIc1crwl5UOpvxBDooPeSFWodYz9gS72mxLxEi
X-Gm-Message-State: AOJu0YwTx/shGGbnm/O+uxKe3S+9CYAWDvntroYs5OhWi8X2ESICbRhX
 c/1q/7an/JBtqhW/fmQX9ZvqARmqvBIJNaCi4XmAnAWmoedixmfuF1ySCJFmcT4=
X-Google-Smtp-Source: AGHT+IFlUXGV4chig6oJvZqV4vGOgLfE+s5gAYd5D5SfvJ7gnZEYS1RqOGC2YxcHgRm7Hvepr5Q2zg==
X-Received: by 2002:a17:902:c14b:b0:1e0:a7c5:b5a5 with SMTP id
 11-20020a170902c14b00b001e0a7c5b5a5mr67760plj.37.1712168525743; 
 Wed, 03 Apr 2024 11:22:05 -0700 (PDT)
Received: from localhost ([192.184.165.199]) by smtp.gmail.com with ESMTPSA id
 c2-20020a170902d48200b001dd652ef8d6sm13572476plg.152.2024.04.03.11.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 11:22:04 -0700 (PDT)
Date: Wed, 03 Apr 2024 11:22:04 -0700 (PDT)
X-Google-Original-Date: Wed, 03 Apr 2024 11:21:38 PDT (-0700)
Subject: Re: [PATCH v1 2/2] RISC-V: drop SOC_VIRT for ARCH_VIRT
In-Reply-To: <20240305-stress-earflap-d7ddb8655a4d@spud>
CC: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
 linux-kernel@vger.kernel.org, brendan.higgins@linux.dev, davidgow@google.com,
 rmoar@google.com, 
 Jason@zx2c4.com, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, 
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-170f61cd-c3b7-413b-8279-9d50d55dbebe@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On Tue, 05 Mar 2024 10:37:06 PST (-0800), Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The ARCH_ and SOC_ versions of this symbol have persisted for quite a
> while now in parallel. Generated .config files from previous LTS kernels
> should have both. Finally remove SOC_VIRT and update all config files
> using it.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> I had a 1.5 year old ack from Jason that I dropped due to the passage of
> time.
>
> CC: Paul Walmsley <paul.walmsley@sifive.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: Albert Ou <aou@eecs.berkeley.edu>
> CC: Brendan Higgins <brendan.higgins@linux.dev>
> CC: David Gow <davidgow@google.com>
> CC: Rae Moar <rmoar@google.com>
> CC: "Jason A. Donenfeld" <Jason@zx2c4.com>
> CC: Shuah Khan <shuah@kernel.org>
> CC: linux-riscv@lists.infradead.org
> CC: linux-kernel@vger.kernel.org
> CC: linux-kselftest@vger.kernel.org
> CC: kunit-dev@googlegroups.com
> CC: wireguard@lists.zx2c4.com
> CC: netdev@vger.kernel.org
> ---
>  arch/riscv/Kconfig.socs                                    | 3 ---
>  arch/riscv/configs/defconfig                               | 2 +-
>  arch/riscv/configs/nommu_virt_defconfig                    | 2 +-
>  tools/testing/kunit/qemu_configs/riscv.py                  | 2 +-
>  tools/testing/selftests/wireguard/qemu/arch/riscv32.config | 2 +-
>  tools/testing/selftests/wireguard/qemu/arch/riscv64.config | 2 +-
>  6 files changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index e85ffb63c48d..dcbfb659839c 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -52,9 +52,6 @@ config ARCH_THEAD
>  	  This enables support for the RISC-V based T-HEAD SoCs.
>
>  config ARCH_VIRT
> -	def_bool SOC_VIRT
> -
> -config SOC_VIRT
>  	bool "QEMU Virt Machine"
>  	select CLINT_TIMER if RISCV_M_MODE
>  	select POWER_RESET
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index ab3bab313d56..8d46a9137b1e 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -32,7 +32,7 @@ CONFIG_ARCH_SOPHGO=y
>  CONFIG_SOC_STARFIVE=y
>  CONFIG_ARCH_SUNXI=y
>  CONFIG_ARCH_THEAD=y
> -CONFIG_SOC_VIRT=y
> +CONFIG_ARCH_VIRT=y
>  CONFIG_SMP=y
>  CONFIG_HOTPLUG_CPU=y
>  CONFIG_PM=y
> diff --git a/arch/riscv/configs/nommu_virt_defconfig b/arch/riscv/configs/nommu_virt_defconfig
> index b794e2f8144e..de8143d1f738 100644
> --- a/arch/riscv/configs/nommu_virt_defconfig
> +++ b/arch/riscv/configs/nommu_virt_defconfig
> @@ -24,7 +24,7 @@ CONFIG_EXPERT=y
>  CONFIG_SLUB=y
>  CONFIG_SLUB_TINY=y
>  # CONFIG_MMU is not set
> -CONFIG_SOC_VIRT=y
> +CONFIG_ARCH_VIRT=y
>  CONFIG_NONPORTABLE=y
>  CONFIG_SMP=y
>  CONFIG_CMDLINE="root=/dev/vda rw earlycon=uart8250,mmio,0x10000000,115200n8 console=ttyS0"
> diff --git a/tools/testing/kunit/qemu_configs/riscv.py b/tools/testing/kunit/qemu_configs/riscv.py
> index 12a1d525978a..c87758030ff7 100644
> --- a/tools/testing/kunit/qemu_configs/riscv.py
> +++ b/tools/testing/kunit/qemu_configs/riscv.py
> @@ -13,7 +13,7 @@ if not os.path.isfile(OPENSBI_PATH):
>
>  QEMU_ARCH = QemuArchParams(linux_arch='riscv',
>  			   kconfig='''
> -CONFIG_SOC_VIRT=y
> +CONFIG_ARCH_VIRT=y
>  CONFIG_SERIAL_8250=y
>  CONFIG_SERIAL_8250_CONSOLE=y
>  CONFIG_SERIAL_OF_PLATFORM=y
> diff --git a/tools/testing/selftests/wireguard/qemu/arch/riscv32.config b/tools/testing/selftests/wireguard/qemu/arch/riscv32.config
> index 2fc36efb166d..2500eaa9b469 100644
> --- a/tools/testing/selftests/wireguard/qemu/arch/riscv32.config
> +++ b/tools/testing/selftests/wireguard/qemu/arch/riscv32.config
> @@ -2,7 +2,7 @@ CONFIG_NONPORTABLE=y
>  CONFIG_ARCH_RV32I=y
>  CONFIG_MMU=y
>  CONFIG_FPU=y
> -CONFIG_SOC_VIRT=y
> +CONFIG_ARCH_VIRT=y
>  CONFIG_SERIAL_8250=y
>  CONFIG_SERIAL_8250_CONSOLE=y
>  CONFIG_SERIAL_OF_PLATFORM=y
> diff --git a/tools/testing/selftests/wireguard/qemu/arch/riscv64.config b/tools/testing/selftests/wireguard/qemu/arch/riscv64.config
> index dc266f3b1915..29a67ac67766 100644
> --- a/tools/testing/selftests/wireguard/qemu/arch/riscv64.config
> +++ b/tools/testing/selftests/wireguard/qemu/arch/riscv64.config
> @@ -1,7 +1,7 @@
>  CONFIG_ARCH_RV64I=y
>  CONFIG_MMU=y
>  CONFIG_FPU=y
> -CONFIG_SOC_VIRT=y
> +CONFIG_ARCH_VIRT=y
>  CONFIG_SERIAL_8250=y
>  CONFIG_SERIAL_8250_CONSOLE=y
>  CONFIG_SERIAL_OF_PLATFORM=y

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
