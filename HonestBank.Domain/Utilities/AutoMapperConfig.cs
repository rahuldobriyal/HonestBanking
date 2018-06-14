using AutoMapper;
using System.Collections.Generic;
using DataModel = HonestBank.Domain.Data;
using LogicModel = HonestBank.Domain.ModelData;

namespace HonestBank.Domain.Utilities
{
    public static class AutoMapperConfig
    {
        public static void RegisterMappings()
        {
            Mapper.Initialize(cfg => {
                cfg.CreateMap<LogicModel.BranchModel, DataModel.Branch>()
                    .ForMember(dest => dest.BranchID, opts => opts.MapFrom(src => src.BranchID))
                    .ForMember(dest => dest.Name, opts => opts.MapFrom(src => src.Name))
                    .ForMember(dest => dest.City, opts => opts.MapFrom(src => src.City))
                    .ForMember(dest => dest.Address, opts => opts.MapFrom(src => src.Address))
                    .ForMember(dest => dest.State, opts => opts.MapFrom(src => src.State))
                    .ForMember(dest => dest.ZipCode, opts => opts.MapFrom(src => src.ZipCode))
                    .ForMember(dest => dest.Accounts, opts => opts.Ignore())
                    .ForMember(dest => dest.AccountTransactions, opts => opts.Ignore())
                    .ForMember(dest => dest.Employees, opts => opts.Ignore());

                cfg.CreateMap<DataModel.Branch,LogicModel.BranchModel>()
                    .ForMember(dest => dest.BranchID, opts => opts.MapFrom(src => src.BranchID))
                    .ForMember(dest => dest.Name, opts => opts.MapFrom(src => src.Name))
                    .ForMember(dest => dest.City, opts => opts.MapFrom(src => src.City))
                    .ForMember(dest => dest.Address, opts => opts.MapFrom(src => src.Address))
                    .ForMember(dest => dest.State, opts => opts.MapFrom(src => src.State))
                    .ForMember(dest => dest.ZipCode, opts => opts.MapFrom(src => src.ZipCode));
            });   
        }
    }
}
